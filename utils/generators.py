from __future__ import annotations

import asyncio
from pathlib import Path
from typing import List, Dict, Tuple, Optional, NamedTuple
from datetime import datetime

from entry_types import DesignEntry
from utils.LLM_call import LLMClient, extract_between_markers
from utils.equivalence_check import (
    check_equivalence,
    check_equivalence_detailed,
    check_elaborates,
    equiv_settings,
    EquivStatus,
)
from utils.mutate import standardize
from utils.config import Config
from pydantic import BaseModel
import traceback


class DebugLogger:
    """Centralized debug logging system for all generators."""
    
    def __init__(self, config: Config):
        self.enabled = config.debug_enabled
        self.log_file = config.debug_log_file
        self._log_file_path = Path(self.log_file)
        
        # Ensure log directory exists
        self._log_file_path.parent.mkdir(parents=True, exist_ok=True)
    
    def log(self, message: str, level: str = "INFO"):
        """Log a message with timestamp and level."""
        if not self.enabled:
            return
            
        timestamp = datetime.now().strftime("%Y-%m-%d %H:%M:%S")
        log_entry = f"[{timestamp}] [{level}] {message}"

        if level == "ERROR":
            print(f"Error: {message}")
            print(traceback.format_exc())
        
        try:
            with open(self._log_file_path, 'a', encoding='utf-8') as f:
                f.write(log_entry + '\n')
        except Exception as e:
            print(f"Error writing to log file: {e}")
        
    
    def log_llm_call(self, messages: List[Dict[str, str]], response: str, metadata: Dict):
        """Log LLM API calls with request and response."""
        if not self.enabled:
            return
            
        self.log("=" * 50)
        self.log("LLM API CALL")
        self.log(f"Messages: {messages}")
        self.log(f"Response: {response}")
        self.log(f"Metadata: {metadata}")
        self.log("=" * 50)


class QuestionGenerator:
    """
    Generates natural-language questions for a given design.

    Holds a `DesignEntry` and an `LLMClient` for reuse. Also provides a
    convenience classmethod to generate a question without instantiating.
    """

    def __init__(self, design_entry: DesignEntry, client: LLMClient, config: Config, debug_logger: Optional[DebugLogger] = None) -> None:
        self.design_entry = design_entry
        self.client = client
        self.config = config
        self.debug_logger = debug_logger or DebugLogger(config)

    @staticmethod
    def _build_prompt(verilog_module: str) -> List[Dict[str, str]]:
        """
        Construct a prompt that asks for a LeetCode-style problem statement whose
        unique correct answer is the provided Verilog module. The model should
        NOT output any code, only the problem text between markers so callers
        can reliably extract it.
        """
        system_msg = (
            "You are an expert hardware interview question writer. You craft clear,\n"
            "concise, LeetCode-style problem statements about designing RTL modules.\n"
            "Only output the problem statement; do not include any solution code."
        )

        user_msg = (
            "Create a LeetCode-style question whose unique correct answer is the\n"
            "following Verilog module. The question should:\n"
            "- State the exact module name and every port with its exact name, direction and width\n"
            "  (answers are checked by formal equivalence, so names and widths must match).\n"
            "- Describe the required behavior functionally: what the circuit computes, its reset\n"
            "  behavior, timing (combinational vs. registered, which clock edge), and edge cases.\n"
            "- Be precise enough that only circuits equivalent to the target satisfy it, including\n"
            "  any unusual or non-standard behavior the target has (do not 'correct' it).\n"
            "- NOT read as pseudocode: do not list next-state equations bit by bit, name internal\n"
            "  registers, or describe the code structure. A solver should have to design the\n"
            "  circuit, not transcribe it.\n"
            "- Avoid revealing implementation details or providing code.\n"
            "- Be self-contained and unambiguous.\n"
            "- Fit within 150-300 words.\n\n"
            "Return ONLY the question text between the exact markers below.\n"
            "QUESTION BEGIN\n"
            "<write the problem statement here>\n"
            "QUESTION END\n\n"
            "Target Verilog module (ground-truth answer):\n"
            "----- BEGIN VERILOG -----\n"
            f"{verilog_module}\n"
            "----- END VERILOG -----\n"
        )

        return [
            {"role": "system", "content": system_msg},
            {"role": "user", "content": user_msg},
        ]

    async def generate(self, model="deepseek", model_id: str = "", temperature: float = 0.6) -> str:
        """Instance method: generate a question for the held design."""
        msgs = self._build_prompt(self.design_entry.content)
        response, metadata = await self.client.call(msgs, model, model_id=model_id, temperature=temperature)
        
        # Log the LLM call if debug is enabled
        self.debug_logger.log_llm_call(msgs, response, metadata)
        
        question = extract_between_markers(response, "QUESTION BEGIN", "QUESTION END")
        self.debug_logger.log(f"Generated question: {question[:100]}...")
        return question

    @classmethod
    async def orig_gen(
        cls,
        design_entry: DesignEntry,
        client: LLMClient,
        model="deepseek",
        model_id: str = "",
        temperature: float = 0.6,
        debug_logger: Optional[DebugLogger] = None
    ) -> str:
        """
        Class method: prompts DeepSeek to generate a LeetCode-style question
        whose answer is the Verilog module found in `design_entry`.

        Returns the extracted question text.
        """
        msgs = cls._build_prompt(design_entry.content)
        response, metadata = await client.call(msgs, model, model_id=model_id, temperature=temperature)
        
        # Log the LLM call if debug is enabled
        if debug_logger:
            debug_logger.log_llm_call(msgs, response, metadata)
        
        question = extract_between_markers(response, "QUESTION BEGIN", "QUESTION END")
        return question

def extract_code(content: str) -> str:
    """
    Extract code from a response by looking for fenced blocks (``` or ---).
    If no block is found, return the original content.
    """
    inside = False
    lines = content.split("\n")
    collected: List[str] = []
    saw_block = False
    for line in lines:
        stripped = line.strip()
        if stripped.startswith("```") or stripped.startswith("---"):
            inside = not inside
            saw_block = True
            continue
        if inside:
            collected.append(line)
    if not saw_block:
        return content
    return "\n".join(collected)

class AnswerGenerator:
    """
    Generates Verilog answers (modules) for a given natural-language question.

    Usage:
        ag = AnswerGenerator(question_text, client, config)
        answers: List[str] = await ag.generate_answers(n)
    """

    def __init__(self, question: str, client: LLMClient, config: Config, prompt_path: str = "./templates/rtl_gen.txt", debug_logger: Optional[DebugLogger] = None) -> None:
        self.question = question
        self.client = client
        self.config = config
        self.prompt = self._load_prompt(prompt_path)
        self.debug_logger = debug_logger or DebugLogger(config)

    @staticmethod
    def _load_prompt(prompt_path: str) -> str:
        path = Path(prompt_path)
        return path.read_text(encoding="utf-8")

    def _build_messages(self) -> List[Dict[str, str]]:
        # Mirror the pattern used elsewhere: pass the generation prompt, then append the question
        full_prompt = f"{self.prompt}{self.question}"
        return [{"role": "system", "content": full_prompt}]

    async def generate_answers(self, n: int, model="deepseek", model_id: str = "", temperature: float = 0.6) -> List[str]:
        """
        Generate n candidate Verilog answers for the stored question.
        Returns a list of n strings (best-effort; may be fewer if some calls fail).
        """
        msgs = self._build_messages()
        tasks = [self.client.call(msgs, model, model_id=model_id, temperature=temperature) for _ in range(n)]
        results = await asyncio.gather(*tasks, return_exceptions=True)

        # print("done")
        answers: List[str] = []
        for i, result in enumerate(results):
            if isinstance(result, Exception):
                self.debug_logger.log(f"Error generating answer {i+1}: {result}", "ERROR")
                continue
                
            response, metadata = result
            self.debug_logger.log(f"Generated answer {i+1}: {response[:100]}...")
            
            # Extract Verilog code from response
            code = extract_code(response)
            try:
                standardized_code = standardize(code)
                answers.append(standardized_code)
                self.debug_logger.log(f"Standardized answer {i+1}: {standardized_code[:100]}...")
            except Exception as e:
                self.debug_logger.log(f"Error standardizing answer {i+1}: {e}", "ERROR")
                # print(f"{response}")
        
        self.debug_logger.log(f"Generated {len(answers)} valid answers out of {n} attempts")
        return answers


class AssistedAnswerGenerator:
    """
    Generates Verilog answers (modules) for a given natural-language question,
    with assistance from a reference design.

    Usage:
        aag = AssistedAnswerGenerator(question_text, client, config, design)
        answers: List[str] = await aag.generate_answers(n)
    """

    def __init__(self, question: str, client: LLMClient, config: Config, design: str, prompt_path: str = "./templates/rtl_gen.txt", debug_logger: Optional[DebugLogger] = None) -> None:
        self.question = question
        self.client = client
        self.config = config
        self.design = design
        self.prompt = self._load_prompt(prompt_path)
        self.debug_logger = debug_logger or DebugLogger(config)

    @staticmethod
    def _load_prompt(prompt_path: str) -> str:
        path = Path(prompt_path)
        return path.read_text(encoding="utf-8")

    def _build_messages(self) -> List[Dict[str, str]]:
        # Include the design in the prompt to provide assistance
        full_prompt = f"{self.prompt}\n\n{self.question}\n\nIn addition, here is a design that is slightly different that the one requested. Use this design to help you generate the answer:\n\n{self.design}"
        return [{"role": "system", "content": full_prompt}]

    async def generate_answers(self, n: int, model="deepseek", model_id: str = "", temperature: float = 0.6) -> List[str]:
        """
        Generate n candidate Verilog answers for the stored question.
        Returns a list of n strings (best-effort; may be fewer if some calls fail).
        """
        msgs = self._build_messages()
        tasks = [self.client.call(msgs, model, model_id=model_id, temperature=temperature) for _ in range(n)]
        results = await asyncio.gather(*tasks, return_exceptions=True)

        # print("done")
        answers: List[str] = []
        for i, result in enumerate(results):
            if isinstance(result, Exception):
                self.debug_logger.log(f"Error generating answer {i+1}: {result}", "ERROR")
                continue
                
            response, metadata = result
            self.debug_logger.log(f"Generated answer {i+1}: {response[:100]}...")
            
            # Extract Verilog code from response
            code = extract_between_markers(response, "```verilog", "```")
            if not code.strip():
                # Fallback: try without verilog marker
                code = extract_between_markers(response, "```", "```")
            
            if code.strip():
                # Standardize the code
                try:
                    standardized_code = standardize(code)
                    answers.append(standardized_code)
                    self.debug_logger.log(f"Standardized answer {i+1}: {standardized_code[:100]}...")
                except Exception as e:
                    self.debug_logger.log(f"Error standardizing answer {i+1}: {e}", "ERROR")
                    # Use original code if standardization fails
                    answers.append(code)
            else:
                self.debug_logger.log(f"No code found in answer {i+1}, using raw response", "WARNING")
                answers.append(response)
        
        self.debug_logger.log(f"Generated {len(answers)} valid answers out of {n} attempts")
        return answers


class ValidQuestionGenerator:
    """
    Validates that a generated question pins down its target design.

    The answer generator is given ONLY the question text (never the target
    code). It samples n candidate solutions, and each is formally checked
    against the target with Yosys. All n are checked (no early exit) so the
    result doubles as a difficulty signal.

    After `validate()`:
      valid_question       True if at least one sample is equivalent
      solve_rate           fraction of samples that are equivalent
      answer_statuses      per-sample EquivStatus values (as strings)
      generated_answers    the sampled answers
      proof_strength       "proven" if some sample was proven equivalent,
                           "bounded" if the best was only bounded, else None

    Bounded results (no counterexample within the step limit but induction did
    not close) count as passing only if config.equiv_accept_bounded is true.
    """

    def __init__(self, qg: QuestionGenerator, ag: AnswerGenerator, config: Config, debug_logger: Optional[DebugLogger] = None) -> None:
        self.qg = qg
        self.ag = ag
        self.config = config
        self.n = config.question_validation_n
        self.accept_bounded = getattr(config, "equiv_accept_bounded", True)
        self.equiv_kwargs = equiv_settings(config)
        self.semaphore = asyncio.Semaphore(getattr(config, "max_concurrent_yosys", 4))
        self.debug_logger = debug_logger or DebugLogger(config)
        self.valid_question: bool = False
        self.solve_rate: float = 0.0
        self.answer_statuses: List[str] = []
        self.generated_answers: List[str] = []
        self.proof_strength: Optional[str] = None

    async def validate(self, model: str = "deepseek", model_id: str = "", temperature: float = 0.6) -> bool:
        """Validate the question by sampling answers from the question alone and checking equivalence."""
        if not getattr(self.ag, "question", "").strip():
            raise ValueError("ValidQuestionGenerator.validate(): the answer generator has no question set")
        if getattr(self.ag, "design", None):
            raise ValueError("ValidQuestionGenerator.validate(): answer generator must not be given the target design")

        self.debug_logger.log(f"Validating question: sampling {self.n} unassisted answers...")
        answers = await self.ag.generate_answers(self.n, model=model, model_id=model_id, temperature=temperature)
        self.generated_answers = [a for a in answers if isinstance(a, str) and a.strip()]
        if not self.generated_answers:
            self.debug_logger.log("No usable answers generated", "WARNING")
            return False

        ground_truth = self.qg.design_entry.content
        batch_dir = self.config.batch_dir_path

        async def check(ans: str):
            async with self.semaphore:
                return await check_equivalence_detailed(batch_dir, ans, ground_truth, **self.equiv_kwargs)

        results = await asyncio.gather(*[check(a) for a in self.generated_answers], return_exceptions=True)

        statuses: List[EquivStatus] = []
        for i, res in enumerate(results):
            if isinstance(res, Exception):
                self.debug_logger.log(f"Equivalence check {i+1} raised: {res}", "ERROR")
                statuses.append(EquivStatus.ERROR)
            else:
                statuses.append(res.status)
        self.answer_statuses = [s.value for s in statuses]

        passing = [s for s in statuses if s == EquivStatus.EQUIVALENT or (self.accept_bounded and s == EquivStatus.BOUNDED)]
        # Denominator is n requested samples, so failed generations count against the question.
        self.solve_rate = len(passing) / self.n if self.n else 0.0
        self.valid_question = bool(passing)
        if EquivStatus.EQUIVALENT in statuses:
            self.proof_strength = "proven"
        elif passing:
            self.proof_strength = "bounded"

        self.debug_logger.log(
            f"Validation {'passed' if self.valid_question else 'failed'}: "
            f"{len(passing)}/{self.n} samples equivalent (statuses: {self.answer_statuses})"
        )
        return self.valid_question


class BugCategory(BaseModel):
    bug_type: str
    description: str
    applicability: str

class BugCategories(BaseModel):
    bug_categories: list[BugCategory]

class MutationGenerator:
    """
    Analyzes an RTL design and generates a tailored list of possible bug categories
    that could be applied to that specific design using LLM intelligence.
    
    Takes a DesignEntry and an LLMClient to generate n possible bug categories tailored 
    to the design's characteristics. Each category specifies a general bug type followed
    by a specific implementation detail relevant to the design.
    
    Usage:
        mg = MutationGenerator(design_entry, client, config)
        bug_categories = await mg.generate_bug_categories()
    """

    def __init__(self, design_entry: DesignEntry, client: LLMClient, config: Config, debug_logger: Optional[DebugLogger] = None) -> None:
        self.design_entry = design_entry
        self.client = client
        self.config = config
        self.n = config.bug_categories_n
        self.debug_logger = debug_logger or DebugLogger(config)

    @staticmethod
    def _build_prompt(verilog_module: str, n: int) -> List[Dict[str, str]]:
        """
        Construct a prompt that asks for bug categories tailored to the specific RTL design.
        The model should analyze the design and return relevant bug types with specific details.
        """
        system_msg = (
            "You are an expert hardware verification engineer specializing in RTL design analysis.\n"
            "Your task is to analyze Verilog code and identify realistic bug categories that could\n"
            "be introduced into the design. Focus on practical, implementable bugs that would\n"
            "actually break the design's functionality."
        )

        user_msg = (
            f"Analyze the following Verilog module and generate {n} realistic bug types\n"
            "that could be introduced into this specific design. Each bug category should include:\n\n"
            "1. A general bug type (e.g., 'bit width mismatch', 'reset logic error')\n"
            "2. A specific implementation detail relevant to this design\n"
            "Focus on bugs that are:\n"
            "- Technically feasible to implement\n"
            "- Would change the design's functionality while still being valid Verilog\n"
            "- Relevant to the specific characteristics of this design\n"
            # "Return ONLY the bug categories between the exact markers below.\n"
            # "Each category should be on its own line with the format:\n"
            # "BUG_TYPE: DESCRIPTION\n\n"
            # "BUG CATEGORIES BEGIN\n"
            # "<write the bug categories here>\n"
            # "BUG CATEGORIES END\n\n"
            # "Target Verilog module to analyze:\n"
            "----- BEGIN VERILOG -----\n"
            f"{verilog_module}\n"
            "----- END VERILOG -----\n"
            # "Do not include any other text in your response."
        )

        return [
            {"role": "system", "content": system_msg},
            {"role": "user", "content": user_msg},
        ]

    async def generate_bug_categories(self, model="gpt", model_id: str = "gpt-4o-mini", temperature: float = 0.6) -> List[Dict[str, str]]:
        """
        Generate n tailored bug categories for the specific design using LLM analysis.
        
        Returns:
            List of dictionaries, each containing:
            - 'bug_type': General category of the bug
            - 'description': Specific description relevant to this design
        """
        msgs = self._build_prompt(self.design_entry.content, self.n)
        response, metadata = await self.client.call(msgs, model, model_id=model_id, temperature=temperature, gpt_json_schema=BugCategories)
        bug_categories = response.bug_categories
        bug_categories = [{'bug_type': bug_category.bug_type, 'description': bug_category.description, 'applicability': bug_category.applicability} for bug_category in bug_categories]
        # Log the LLM call if debug is enabled
        self.debug_logger.log_llm_call(msgs, response, metadata)
        # Limit to requested number and ensure we have enough
        if len(bug_categories) < self.n:
            self.debug_logger.log(f"Warning: Only generated {len(bug_categories)} categories, requested {self.n}", "WARNING")
        
        return bug_categories

    def _parse_bug_categories(self, categories_text: str) -> List[Dict[str, str]]:
        """
        Parse the LLM response text into structured bug category dictionaries.
        
        Expected format: "BUG_TYPE: DESCRIPTION - APPLICABILITY"
        """
        bug_categories = []
        
        if not categories_text or not categories_text.strip():
            self.debug_logger.log("No bug categories text to parse", "WARNING")
            return bug_categories
        
        lines = categories_text.strip().split('\n')
        
        for line in lines:
            line = line.strip()
            if not line or line.startswith('<') or line.startswith('>'):
                continue
                
            # Try to parse the format "BUG_TYPE: DESCRIPTION - APPLICABILITY"
            if ':' in line and ' - ' in line:
                try:
                    # Split on first colon and then on last dash
                    colon_parts = line.split(':', 1)
                    if len(colon_parts) == 2:
                        bug_type = colon_parts[0].strip()
                        rest = colon_parts[1].strip()
                        
                        # Split on last dash to separate description and applicability
                        if ' - ' in rest:
                            dash_parts = rest.rsplit(' - ', 1)
                            if len(dash_parts) == 2:
                                description = dash_parts[0].strip()
                                applicability = dash_parts[1].strip()
                                
                                bug_categories.append({
                                    'bug_type': bug_type,
                                    'description': description,
                                    'applicability': applicability
                                })
                                continue
                        
                        # Fallback: treat everything after colon as description
                        bug_categories.append({
                            'bug_type': bug_type,
                            'description': rest,
                            'applicability': f"Applicable to {self.design_entry.name if hasattr(self.design_entry, 'name') else 'this design'}"
                        })
                        
                except Exception as e:
                    self.debug_logger.log(f"Error parsing line '{line}': {e}", "ERROR")
                    continue
            
            # Fallback: treat the whole line as a bug type
            elif line:
                bug_categories.append({
                    'bug_type': line,
                    'description': f"Introduce {line.lower()} in the design",
                    'applicability': f"General {line.lower()} issue applicable to this design"
                })
        
        self.debug_logger.log(f"Parsed {len(bug_categories)} bug categories from LLM response")
        return bug_categories

    @classmethod
    async def orig_gen(
        cls,
        design_entry: DesignEntry,
        client: LLMClient,
        config: Config,
        model="deepseek",
        model_id: str = "",
        temperature: float = 0.6,
        debug_logger: Optional[DebugLogger] = None
    ) -> List[Dict[str, str]]:
        """
        Class method: prompts Deepseek to generate bug categories for the Verilog module
        found in `design_entry`.

        Returns the extracted and parsed bug categories.
        """
        mg = cls(design_entry, client, config, debug_logger)
        return await mg.generate_bug_categories(model, model_id, temperature)


class MutantGenerator:
    """
    Generates actual mutant Verilog code by applying bug categories to a design.
    
    Takes bug categories from MutationGenerator, randomly selects n of them,
    and uses LLMs to generate mutant Verilog code that implements each bug.
    
    Usage:
        mg = MutantGenerator(design_entry, client, config)
        mutants = await mg.generate_mutants(bug_categories)
    """
    
    def __init__(self, design_entry: DesignEntry, client: LLMClient, config: Config, debug_logger: Optional[DebugLogger] = None) -> None:
        self.design_entry = design_entry
        self.client = client
        self.config = config
        self.n = config.mutants_n
        self.debug_logger = debug_logger or DebugLogger(config)

    @staticmethod
    def _build_prompt(verilog_module: str, bug_type: str, bug_description: str) -> List[Dict[str, str]]:
        """
        Construct a prompt that asks for mutant Verilog code implementing a specific bug.
        The model should return valid Verilog that applies the bug to the original design.
        """
        system_msg = (
            "You are an expert hardware engineer specializing in RTL design and debugging.\n"
            "Your task is to create a mutant version of a Verilog module by introducing\n"
            "a specific bug while keeping the code syntactically valid and compilable."
        )

        user_msg = (
            f"Create a mutant version of the following Verilog module by introducing this bug:\n\n"
            f"BUG TYPE: {bug_type}\n"
            f"BUG DESCRIPTION: {bug_description}\n\n"
            f"Requirements:\n"
            f"- The mutant must be valid, compilable Verilog\n"
            f"- Keep the same module interface (ports, parameters)\n"
            f"- Make minimal changes to introduce the bug\n"
            f"Return ONLY the mutant Verilog code between the exact markers below.\n\n"
            f"MUTANT VERILOG BEGIN\n"
            f"<write the mutant Verilog code here>\n"
            f"MUTANT VERILOG END\n\n"
            f"Original Verilog module to mutate:\n"
            f"----- BEGIN VERILOG -----\n"
            f"{verilog_module}\n"
            f"----- END VERILOG -----\n"
            f"Do not include any other text in your response."
        )

        return [
            {"role": "system", "content": system_msg},
            {"role": "user", "content": user_msg},
        ]

    async def generate_mutants(self, bug_categories: List[Dict[str, str]], model="deepseek", model_id: str = "", temperature: float = 0.7) -> List[Tuple[str, str]]:
        """
        Generate n mutant Verilog codes by randomly selecting bug categories and applying them.
        
        Args:
            bug_categories: List of bug categories from MutationGenerator
            model: Model to use for generation (default: "deepseek")
            model_id: Specific model ID to use (default: "")
            temperature: Temperature for LLM generation
            
        Returns:
            List of tuples: (mutant_verilog_code, bug_type_used)
        """
        if not bug_categories:
            self.debug_logger.log("No bug categories provided", "WARNING")
            return []
        
        # Randomly select n bug categories
        import random
        selected_bugs = random.sample(bug_categories, min(self.n, len(bug_categories)))
        
        self.debug_logger.log(f"Selected {len(selected_bugs)} bug categories for mutation generation")
        
        # Generate all candidate mutants concurrently
        candidates = await asyncio.gather(
            *[self._generate_single_mutant(bug, model, model_id, temperature) for bug in selected_bugs],
            return_exceptions=True,
        )

        mutants: List[Tuple[str, str]] = []
        self.rejections: List[Dict[str, str]] = []
        for bug, code in zip(selected_bugs, candidates):
            if isinstance(code, Exception) or not code:
                self.rejections.append({"bug_type": bug["bug_type"], "reason": "generation_failed"})
                continue
            reason = await self._reject_reason(code, [m for m, _ in mutants])
            if reason:
                self.rejections.append({"bug_type": bug["bug_type"], "reason": reason})
                self.debug_logger.log(f"Rejected mutant for '{bug['bug_type']}': {reason}", "WARNING")
                continue
            mutants.append((code, bug["bug_type"]))

        self.debug_logger.log(
            f"Kept {len(mutants)}/{len(selected_bugs)} mutants; rejections: {self.rejections}"
        )
        return mutants

    async def _reject_reason(self, mutant_code: str, accepted: List[str]) -> Optional[str]:
        """
        A mutant is kept only if it is a genuinely new circuit:
          - it must parse and elaborate in Yosys,
          - Yosys must find a counterexample against the original (DIFFERENT);
            BOUNDED/UNKNOWN means we could not show it differs, so it is rejected,
          - it must not be equivalent to a mutant already kept for this design.
        """
        kw = equiv_settings(self.config)
        batch_dir = self.config.batch_dir_path

        elab = await check_elaborates(batch_dir, mutant_code, **kw)
        if elab.status != EquivStatus.EQUIVALENT:
            return f"does_not_elaborate ({elab.status.value}: {elab.detail[:120]})"

        vs_orig = await check_equivalence_detailed(batch_dir, mutant_code, self.design_entry.content, **kw)
        if vs_orig.status != EquivStatus.DIFFERENT:
            return f"not_distinct_from_original ({vs_orig.status.value})"

        for other in accepted:
            r = await check_equivalence_detailed(batch_dir, mutant_code, other, **kw)
            if r.status in (EquivStatus.EQUIVALENT, EquivStatus.BOUNDED):
                return f"duplicate_of_kept_mutant ({r.status.value})"
        return None

    async def _generate_single_mutant(self, bug: Dict[str, str], model: str = "deepseek", model_id: str = "", temperature: float = 0.7) -> Optional[str]:
        """Generate a single mutant for a specific bug category."""
        msgs = self._build_prompt(self.design_entry.content, bug['bug_type'], bug['description'])
        
        try:
            response, metadata = await self.client.call(msgs, model, model_id=model_id, temperature=temperature)
            
            # Log the LLM call if debug is enabled
            self.debug_logger.log_llm_call(msgs, response, metadata)
            
            # Extract mutant Verilog code from the response
            mutant_code = extract_between_markers(response, "MUTANT VERILOG BEGIN", "MUTANT VERILOG END")
            
            if not mutant_code or not mutant_code.strip():
                self.debug_logger.log(f"No mutant code found in response for {bug['bug_type']}", "WARNING")
                return None
            
            # Basic validation that we got some Verilog code
            if "module" not in mutant_code.lower():
                self.debug_logger.log(f"Generated code doesn't appear to be Verilog for {bug['bug_type']}", "WARNING")
                return None
            
            # Standardize the code
            try:
                from utils.mutate import standardize
                standardized_code = standardize(mutant_code)
                self.debug_logger.log(f"Successfully standardized mutant code for {bug['bug_type']}")
                return standardized_code
            except Exception as e:
                self.debug_logger.log(f"Error standardizing mutant code for {bug['bug_type']}: {e}", "WARNING")
                # Return original code if standardization fails
                return mutant_code.strip()
                
        except Exception as e:
            self.debug_logger.log(f"Error calling LLM for {bug['bug_type']}", "ERROR")
            return None

    def select_bugs_randomly(self, bug_categories: List[Dict[str, str]], n: int = None) -> List[Dict[str, str]]:
        """
        Randomly select n bug categories from the provided list.
        
        Args:
            bug_categories: List of bug categories to select from
            n: Number of bugs to select (defaults to self.n)
            
        Returns:
            List of randomly selected bug categories
        """
        if n is None:
            n = self.n
            
        if not bug_categories:
            return []
            
        import random
        return random.sample(bug_categories, min(n, len(bug_categories)))

    @classmethod
    async def orig_gen(
        cls,
        design_entry: DesignEntry,
        client: LLMClient,
        config: Config,
        bug_categories: List[Dict[str, str]],
        model="deepseek",
        model_id: str = "",
        temperature: float = 0.7,
        debug_logger: Optional[DebugLogger] = None
    ) -> List[Tuple[str, str]]:
        """
        Class method: generates mutants for the given bug categories.
        
        Args:
            design_entry: The design entry to mutate
            client: LLM client for API calls
            config: Configuration object
            bug_categories: List of bug categories from MutationGenerator
            model: Model to use for generation (default: "deepseek")
            model_id: Specific model ID to use (default: "")
            temperature: Temperature for LLM generation
            debug_logger: Optional debug logger
            
        Returns:
            List of tuples: (mutant_verilog_code, bug_type_used)
        """
        mg = cls(design_entry, client, config, debug_logger)
        return await mg.generate_mutants(bug_categories, model, model_id, temperature)

# Convenience function to create all generators with shared debug logging
class Generators(NamedTuple):
    qg: QuestionGenerator
    ag: AnswerGenerator
    vqg: ValidQuestionGenerator
    mg: MutationGenerator
    mutg: MutantGenerator
    aag: AssistedAnswerGenerator


def create_generators(
    design_entry: DesignEntry,
    client: LLMClient,
    config: Config,
    question: str = "",
) -> Generators:
    """
    Create all generators for one design with shared debug logging.

    Access fields by name (gens.qg, gens.vqg, ...) rather than unpacking.
    `vqg` validates with the plain AnswerGenerator `ag`, which only ever sees
    the question text. Pass `question` here or set `gens.ag.question` before
    calling `gens.vqg.validate()`. `aag` (which is shown the target design)
    is kept for experiments but must never be used for validation.
    """
    debug_logger = DebugLogger(config)

    qg = QuestionGenerator(design_entry, client, config, debug_logger)
    ag = AnswerGenerator(question, client, config, debug_logger=debug_logger)
    aag = AssistedAnswerGenerator(question, client, config, design_entry.content, debug_logger=debug_logger)
    vqg = ValidQuestionGenerator(qg, ag, config, debug_logger)
    mg = MutationGenerator(design_entry, client, config, debug_logger)
    mutg = MutantGenerator(design_entry, client, config, debug_logger)

    return Generators(qg, ag, vqg, mg, mutg, aag)

# Backward compatibility aliases
__all__ = [
    'Generators',
    'QuestionGenerator',
    'AnswerGenerator', 
    'AssistedAnswerGenerator',
    'ValidQuestionGenerator',
    'DebugLogger',
    'MutationGenerator',
    'MutantGenerator',
    'create_generators'
]