from __future__ import annotations

import asyncio
from pathlib import Path
from typing import List, Dict, Tuple, Optional
from datetime import datetime

from entry_types import DesignEntry
from utils.LLM_call import LLMClient, extract_between_markers
from utils.equivalence_check import check_equivalence
from utils.mutate import standardize


class DebugLogger:
    """Centralized debug logging system for all generators."""
    
    def __init__(self, enabled: bool = False, log_file: str = "generator_debug.log"):
        self.enabled = enabled
        self.log_file = log_file
        self._log_file_path = Path(log_file)
        
        # Ensure log directory exists
        self._log_file_path.parent.mkdir(parents=True, exist_ok=True)
    
    def log(self, message: str, level: str = "INFO"):
        """Log a message with timestamp and level."""
        if not self.enabled:
            return
            
        timestamp = datetime.now().strftime("%Y-%m-%d %H:%M:%S")
        log_entry = f"[{timestamp}] [{level}] {message}"
        
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

    def __init__(self, design_entry: DesignEntry, client: LLMClient, debug_logger: Optional[DebugLogger] = None) -> None:
        self.design_entry = design_entry
        self.client = client
        self.debug_logger = debug_logger or DebugLogger(enabled=False)

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
            "- Clearly describe the required behavior, I/O interface, and any timing/edge conditions.\n"
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

    async def generate(self, model="deepseek", temperature: float = 0.6) -> str:
        """Instance method: generate a question for the held design."""
        msgs = self._build_prompt(self.design_entry.content)
        response, metadata = await self.client.call(msgs, model, temperature=temperature)
        
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
        temperature: float = 0.6,
        debug_logger: Optional[DebugLogger] = None
    ) -> str:
        """
        Class method: prompts DeepSeek to generate a LeetCode-style question
        whose answer is the Verilog module found in `design_entry`.

        Returns the extracted question text.
        """
        msgs = cls._build_prompt(design_entry.content)
        response, metadata = await client.call(msgs, temperature=temperature)
        
        # Log the LLM call if debug is enabled
        if debug_logger:
            debug_logger.log_llm_call(msgs, response, metadata)
        
        question = extract_between_markers(response, "QUESTION BEGIN", "QUESTION END")
        return question


class AnswerGenerator:
    """
    Generates Verilog answers (modules) for a given natural-language question.

    Usage:
        ag = AnswerGenerator(question_text, client)
        answers: List[str] = await ag.generate_answers(n)
    """

    def __init__(self, question: str, client: LLMClient, prompt_path: str = "./templates/rtl_gen.txt", debug_logger: Optional[DebugLogger] = None) -> None:
        self.question = question
        self.client = client
        self.prompt = self._load_prompt(prompt_path)
        self.debug_logger = debug_logger or DebugLogger(enabled=False)

    @staticmethod
    def _load_prompt(prompt_path: str) -> str:
        path = Path(prompt_path)
        return path.read_text(encoding="utf-8")

    def _build_messages(self) -> List[Dict[str, str]]:
        # Mirror the pattern used elsewhere: pass the generation prompt, then append the question
        full_prompt = f"{self.prompt}{self.question}"
        return [{"role": "system", "content": full_prompt}]

    async def generate_answers(self, n: int, temperature: float = 0.6) -> List[str]:
        """
        Generate n candidate Verilog answers for the stored question.
        Returns a list of n strings (best-effort; may be fewer if some calls fail).
        """
        msgs = self._build_messages()
        tasks = [self.client.call(msgs, temperature=temperature) for _ in range(n)]
        results = await asyncio.gather(*tasks, return_exceptions=True)

        print("done")
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
    Validates that a generated question is sound by checking whether at least
    one of n generated answers is formally equivalent to the original design.

    - Takes a `QuestionGenerator`, an `AnswerGenerator`, and an integer n.
    - Exposes a `valid_question` flag (default False).
    - `validate()` generates n answers and sets `valid_question` True if any
      answer verifies against the original design.
    """

    def __init__(self, qg: QuestionGenerator, ag: AnswerGenerator, n: int, max_concurrent_yosys: int = 4, debug_logger: Optional[DebugLogger] = None) -> None:
        self.qg = qg
        self.ag = ag
        self.n = n
        self.valid_question: bool = False
        # Limit concurrent Yosys processes to prevent resource exhaustion
        self.semaphore = asyncio.Semaphore(max_concurrent_yosys)
        self.debug_logger = debug_logger or DebugLogger(enabled=False)

    async def validate(self) -> bool:
        """Validate the question by generating answers and checking equivalence."""
        self.debug_logger.log("Starting question validation...")
        
        # Ensure yosys batch dir exists
        batch_dir = Path("./yosys_files/")
        batch_dir.mkdir(parents=True, exist_ok=True)

        # Generate n candidate answers
        self.debug_logger.log(f"Generating {self.n} candidate answers...")
        answers: List[str] = await self.ag.generate_answers(self.n)
        answers = [a for a in answers if isinstance(a, str) and a.strip()]
        
        if not answers:
            self.debug_logger.log("No valid answers generated", "WARNING")
            self.valid_question = False
            return self.valid_question

        self.debug_logger.log(f"Generated {len(answers)} valid answers, checking equivalence...")

        # Verify all answers in parallel against the ground truth design
        ground_truth = self.qg.design_entry.content
        
        async def check_with_semaphore(ans):
            async with self.semaphore:
                return await check_equivalence(str(batch_dir), ans, ground_truth)
        
        tasks = [
            check_with_semaphore(ans) for ans in answers
        ]
        
        self.debug_logger.log(f"Running {len(tasks)} equivalence checks in parallel...")
        results = await asyncio.gather(*tasks, return_exceptions=True)

        # Process results
        valid_count = 0
        for i, res in enumerate(results):
            if isinstance(res, Exception):
                self.debug_logger.log(f"Equivalence check {i+1} failed: {res}", "ERROR")
            elif isinstance(res, bool) and res:
                valid_count += 1
                self.debug_logger.log(f"Answer {i+1} is equivalent to ground truth")
                self.valid_question = True
                break

        if self.valid_question:
            self.debug_logger.log(f"Question validation successful! {valid_count} equivalent answer(s) found.")
        else:
            self.debug_logger.log(f"Question validation failed. No equivalent answers found.")
        
        return self.valid_question


class MutationGenerator:
    """
    Analyzes an RTL design and generates a tailored list of possible bug categories
    that could be applied to that specific design using LLM intelligence.
    
    Takes a DesignEntry and an LLMClient to generate n possible bug categories tailored 
    to the design's characteristics. Each category specifies a general bug type followed
    by a specific implementation detail relevant to the design.
    
    Usage:
        mg = MutationGenerator(design_entry, client, n=5)
        bug_categories = await mg.generate_bug_categories()
    """
    
    def __init__(self, design_entry: DesignEntry, client: LLMClient, n: int = 5, debug_logger: Optional[DebugLogger] = None) -> None:
        self.design_entry = design_entry
        self.client = client
        self.n = n
        self.debug_logger = debug_logger or DebugLogger(enabled=False)

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
            "- Common in real RTL development\n\n"
            "Return ONLY the bug categories between the exact markers below.\n"
            "Each category should be on its own line with the format:\n"
            "BUG_TYPE: DESCRIPTION\n\n"
            "BUG CATEGORIES BEGIN\n"
            "<write the bug categories here>\n"
            "BUG CATEGORIES END\n\n"
            "Target Verilog module to analyze:\n"
            "----- BEGIN VERILOG -----\n"
            f"{verilog_module}\n"
            "----- END VERILOG -----\n"
        )

        return [
            {"role": "system", "content": system_msg},
            {"role": "user", "content": user_msg},
        ]

    async def generate_bug_categories(self, temperature: float = 0.6) -> List[Dict[str, str]]:
        """
        Generate n tailored bug categories for the specific design using LLM analysis.
        
        Returns:
            List of dictionaries, each containing:
            - 'bug_type': General category of the bug
            - 'description': Specific description relevant to this design
            - 'applicability': Why this bug type is relevant to this design
        """
        msgs = self._build_prompt(self.design_entry.content, self.n)
        response, metadata = await self.client.call(msgs, temperature=temperature)
        
        # Log the LLM call if debug is enabled
        self.debug_logger.log_llm_call(msgs, response, metadata)
        
        # Extract bug categories from the response
        bug_categories_text = extract_between_markers(response, "BUG CATEGORIES BEGIN", "BUG CATEGORIES END")
        self.debug_logger.log(f"Generated bug categories text: {bug_categories_text[:200]}...")
        
        # Parse the bug categories into structured format
        bug_categories = self._parse_bug_categories(bug_categories_text)

        # Limit to requested number and ensure we have enough
        if len(bug_categories) < self.n:
            self.debug_logger.log(f"Warning: Only generated {len(bug_categories)} categories, requested {self.n}", "WARNING")
        
        return bug_categories[:self.n]

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
        n: int = 5,
        temperature: float = 0.6,
        debug_logger: Optional[DebugLogger] = None
    ) -> List[Dict[str, str]]:
        """
        Class method: prompts Deepseek to generate bug categories for the Verilog module
        found in `design_entry`.

        Returns the extracted and parsed bug categories.
        """
        mg = cls(design_entry, client, n, debug_logger)
        return await mg.generate_bug_categories(temperature)


class MutantGenerator:
    """
    Generates actual mutant Verilog code by applying bug categories to a design.
    
    Takes bug categories from MutationGenerator, randomly selects n of them,
    and uses LLMs to generate mutant Verilog code that implements each bug.
    
    Usage:
        mg = MutantGenerator(design_entry, client, n=3)
        mutants = await mg.generate_mutants(bug_categories)
    """
    
    def __init__(self, design_entry: DesignEntry, client: LLMClient, n: int = 6, debug_logger: Optional[DebugLogger] = None) -> None:
        self.design_entry = design_entry
        self.client = client
        self.n = n
        self.debug_logger = debug_logger or DebugLogger(enabled=False)

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
            f"- Apply the bug in a realistic way that would actually change the design's behavior\n"
            f"- Keep the same module interface (ports, parameters)\n"
            f"- Make minimal changes to introduce the bug\n"
            f"- Ensure the code still compiles and is syntactically correct\n\n"
            f"Return ONLY the mutant Verilog code between the exact markers below.\n\n"
            f"MUTANT VERILOG BEGIN\n"
            f"<write the mutant Verilog code here>\n"
            f"MUTANT VERILOG END\n\n"
            f"Original Verilog module to mutate:\n"
            f"----- BEGIN VERILOG -----\n"
            f"{verilog_module}\n"
            f"----- END VERILOG -----\n"
        )

        return [
            {"role": "system", "content": system_msg},
            {"role": "user", "content": user_msg},
        ]

    async def generate_mutants(self, bug_categories: List[Dict[str, str]], temperature: float = 0.7) -> List[Tuple[str, str]]:
        """
        Generate n mutant Verilog codes by randomly selecting bug categories and applying them.
        
        Args:
            bug_categories: List of bug categories from MutationGenerator
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
        
        # Generate mutants for each selected bug
        mutants = []
        for i, bug in enumerate(selected_bugs):
            try:
                self.debug_logger.log(f"Generating mutant {i+1} for bug: {bug['bug_type']}")
                
                mutant_code = await self._generate_single_mutant(bug, temperature)
                if mutant_code:
                    mutants.append((mutant_code, bug['bug_type']))
                    self.debug_logger.log(f"Successfully generated mutant {i+1}")
                else:
                    self.debug_logger.log(f"Failed to generate mutant {i+1}", "WARNING")
                    
            except Exception as e:
                self.debug_logger.log(f"Error generating mutant {i+1}: {e}", "ERROR")
                continue
        
        self.debug_logger.log(f"Generated {len(mutants)} successful mutants out of {len(selected_bugs)} attempts")
        return mutants

    async def _generate_single_mutant(self, bug: Dict[str, str], temperature: float, model: str = "deepseek") -> Optional[str]:
        """Generate a single mutant for a specific bug category."""
        msgs = self._build_prompt(self.design_entry.content, bug['bug_type'], bug['description'])
        
        try:
            response, metadata = await self.client.call(msgs, model, temperature=temperature)
            
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
            self.debug_logger.log(f"Error calling LLM for {bug['bug_type']}: {e}", "ERROR")
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
        bug_categories: List[Dict[str, str]],
        n: int = 3,
        temperature: float = 0.7,
        debug_logger: Optional[DebugLogger] = None
    ) -> List[Tuple[str, str]]:
        """
        Class method: generates mutants for the given bug categories.
        
        Args:
            design_entry: The design entry to mutate
            client: LLM client for API calls
            bug_categories: List of bug categories from MutationGenerator
            n: Number of mutants to generate
            temperature: Temperature for LLM generation
            debug_logger: Optional debug logger
            
        Returns:
            List of tuples: (mutant_verilog_code, bug_type_used)
        """
        mg = cls(design_entry, client, n, debug_logger)
        return await mg.generate_mutants(bug_categories, temperature)
# Convenience function to create all generators with shared debug logging
def create_generators(
    design_entry: DesignEntry, 
    client: LLMClient, 
    n_answers: int = 10, 
    max_concurrent_yosys: int = 4,
    debug_enabled: bool = False,
    debug_log_file: str = "generator_debug.log"
) -> Tuple[QuestionGenerator, AnswerGenerator, ValidQuestionGenerator, MutationGenerator, MutantGenerator]:
    """
    Create all five generators with shared debug logging.
    
    Args:
        design_entry: The design entry to generate questions for
        client: LLM client for API calls
        n_answers: Number of answers to generate for validation
        max_concurrent_yosys: Maximum concurrent Yosys processes
        debug_enabled: Whether to enable debug logging
        debug_log_file: Path to debug log file
        
    Returns:
        Tuple of (QuestionGenerator, AnswerGenerator, ValidQuestionGenerator, MutationGenerator, MutantGenerator)
    """
    debug_logger = DebugLogger(enabled=debug_enabled, log_file=debug_log_file)
    
    qg = QuestionGenerator(design_entry, client, debug_logger)
    ag = AnswerGenerator("", client, debug_logger=debug_logger)  # Question will be set later
    vqg = ValidQuestionGenerator(qg, ag, n_answers, max_concurrent_yosys, debug_logger)
    mg = MutationGenerator(design_entry, client, n=10, debug_logger=debug_logger)
    mutg = MutantGenerator(design_entry, client, n=6, debug_logger=debug_logger)
    
    return qg, ag, vqg, mg, mutg

# Backward compatibility aliases
__all__ = [
    'QuestionGenerator',
    'AnswerGenerator', 
    'ValidQuestionGenerator',
    'DebugLogger',
    'MutationGenerator',
    'MutantGenerator',
    'create_generators'
]