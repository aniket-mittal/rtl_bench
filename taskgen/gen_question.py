from pathlib import Path
import json
import yaml
import asyncio
import random
from utils.LLM_call import LLMClient
from typing import List, Tuple
import asyncio
from collections import Counter
from utils.mutate import standardize
from utils.hash_utils import hash_string
from utils.equivalence_check import check_equivalence
from utils.generators import create_generators

# Import RTL_GEN_PROMPT from variant_gen.py
RTL_GEN_PROMPT = open('./templates/rtl_gen.txt', 'r').read()

def extract_question(passage: str):
    """
    Extracts the question from a passage by searching for 'QUESTION BEGIN' and 'QUESTION END' markers.

    Args:
        passage (str): The input string containing the question between markers.

    Returns:
        str: The extracted question, or an empty string if markers are not found.
    """
    begin_marker = "QUESTION BEGIN"
    end_marker = "QUESTION END"
    start_idx = passage.find(begin_marker)
    end_idx = passage.find(end_marker)
    if start_idx == -1 or end_idx == -1 or end_idx <= start_idx:
        return ""
    # Move start_idx to the end of the begin_marker
    start_idx += len(begin_marker)
    question = passage[start_idx:end_idx]
    return question.strip()

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

async def gen_question(design: str, debug_enabled: bool = False, debug_log_file: str = "./logs/generator_debug.log"):
    # Load the prompt from gen_q.json
    with open("prompts/gen_q.json", "r") as f:
        prompt_data = json.load(f)
    base_prompt = prompt_data["prompt"]
    # Append the design string to the prompt
    full_prompt = base_prompt + design
    # Prepare the message for LLMClient
    msg = [{'role': 'system', 'content': full_prompt}]
    # You may need to load API key/config as in other files
    with open("config.yaml", "r") as f:
        config = yaml.safe_load(f)
    client = LLMClient((config["calls_per_min"], 60), config["api_key"])
    response, metadata = await client.call(msg, model="deepseek", model_id="")
    question = extract_question(response)
    return question

async def gen_question_bulk(designs: List[str], debug_enabled: bool = False, debug_log_file: str = "./logs/generator_debug.log"):
    """
    Generates questions for a list of design strings.

    Args:
        designs: List of design descriptions.

    Returns:
        List[str]: List of generated questions (responses from LLM).
    """
    # Load the prompt from gen_q.json
    with open("prompts/gen_q.json", "r") as f:
        prompt_data = json.load(f)
    base_prompt = prompt_data["prompt"]

    # Prepare messages for each design
    msgs = []
    for design in designs:
        full_prompt = base_prompt + design
        msg = [{'role': 'system', 'content': full_prompt}]
        msgs.append(msg)

    # Load config
    with open("config.yaml", "r") as f:
        config = yaml.safe_load(f)
    client = LLMClient((config["calls_per_min"], 60), config["api_key"])
    tasks = [client.call(msg, model="deepseek", model_id="") for msg in msgs]
    results = await asyncio.gather(*tasks)
    # results is a list of (response, metadata) tuples
    responses = [resp for resp, _ in results]
    return responses


async def verify_question(question: str, design: str, n: int, k: int, client: LLMClient, debug_enabled: bool = False, debug_log_file: str = "./logs/generator_debug.log") -> Tuple[bool, List[str]]:
    """
    Verifies a question by generating n modules and checking equivalence with the original design.
    
    Args:
        question: The question to verify
        design: The original design string
        n: Number of modules to generate
        k: Number of top most frequent designs to check for equivalence
        client: LLM client for API calls
        debug_enabled: Whether to enable debug logging
        debug_log_file: Path to debug log file
        
    Returns:
        tuple: (True/False for equivalence, List of designs that are/are not equivalent)
    """
    
    # Load config for LLM client
    with open("config.yaml", "r") as f:
        config = yaml.safe_load(f)
    if not client:
        client = LLMClient((config["calls_per_min"], 60), config["api_key"])
    
    # Generate n modules using the question - all at once
    prompt = RTL_GEN_PROMPT + question
    
    # Prepare messages for batch generation
    msgs = []
    for i in range(n):
        msg = [{'role': 'system', 'content': prompt}]
        msgs.append(msg)
    
    # Generate all designs in parallel
    print(f"Generating {n} candidate designs")
    tasks = [client.call(msg, model="deepseek", model_id="") for msg in msgs]
    results = await asyncio.gather(*tasks, return_exceptions=True)
    
    # Process results
    generated_designs = []
    for i, result in enumerate(results):
        if isinstance(result, Exception):
            print(f"Error generating design {i}: {result}")
            continue
        
        response, metadata = result
        try:
            generated_code = extract_code(response)
            generated_designs.append({
                'content': generated_code,
                'hash': None
            })
        except Exception as e:
            print(f"Error processing design {i}: {e}")
            continue
    
    if not generated_designs:
        print("No designs were successfully generated")
        return False, []
    
    # Standardize each design and compute hash
    new_designs = []
    for design_info in generated_designs:
        try: 
            standardized_code = standardize(design_info['content'])
            design_info['content'] = standardized_code
            design_info['hash'] = hash_string(standardized_code)
            new_designs.append(design_info)
        except Exception as e:
            continue
    generated_designs = new_designs

    
    # Find the design with the most unique hash (or first valid one)
    valid_designs = [d for d in generated_designs if d['hash'] is not None]
    if not valid_designs:
        print("No valid designs after standardization")
        return False, []
    
    # Count the frequency of each hash
    hash_counts = Counter(design['hash'] for design in valid_designs)
    
    # Print summary of design distribution
    print(f"Generated {len(valid_designs)} valid designs:")
    for hash_val, count in hash_counts.most_common():
        print(f"  - Hash {hash_val[:16]}... appears {count} time(s)")
    
    # Check equivalence for every uniquely generated design
    unique_hashes = list(hash_counts.keys())
    print(f"✓ Checking all {len(unique_hashes)} unique designs for equivalence")
    
    # Get the actual design contents for all unique hashes
    selected_designs = []
    selected_hashes = []
    for hash_val in unique_hashes:
        # Get the first design with this hash
        design_content = next(d['content'] for d in valid_designs if d['hash'] == hash_val)
        selected_designs.append(design_content)
        selected_hashes.append(hash_val)
    
    # Check equivalence for selected designs in parallel
    batch_file_path = "./yosys_files/"
    print(f"Checking {len(selected_designs)} designs for equivalence in parallel...")
    
    # Limit concurrent Yosys processes to prevent resource exhaustion
    semaphore = asyncio.Semaphore(4)  # Max 4 parallel Yosys instances
    
    async def check_with_semaphore(design_content, design):
        async with semaphore:
            return await check_equivalence(batch_file_path, design_content, design)
    
    # Create tasks for all equivalence checks
    equivalence_tasks = []
    for i, design_content in enumerate(selected_designs):
        task = check_with_semaphore(design_content, design)
        equivalence_tasks.append((i, task))
    
    # Run all equivalence checks in parallel
    results = await asyncio.gather(*[task for _, task in equivalence_tasks], return_exceptions=True)
    
    # Process results
    equivalents = []
    non_equivalents = []
    equiv_flag = False
    
    for i, result in enumerate(results):
        design_idx, _ = equivalence_tasks[i]
        design_content = selected_designs[design_idx]
        hash_val = selected_hashes[design_idx]
        
        if isinstance(result, Exception):
            print(f"Error checking design {design_idx+1}/{len(selected_designs)} (hash: {hash_val[:16]}...): {result}")
            non_equivalents.append(design_content)
            continue
            
        is_equivalent = result
        if is_equivalent:
            equiv_flag = True
            equivalents.append(design_content)
            print(f"✓ Design {design_idx+1}/{len(selected_designs)} (hash: {hash_val[:16]}...) is equivalent")
            break
        else:
            non_equivalents.append(design_content)
            print(f"✗ Design {design_idx+1}/{len(selected_designs)} (hash: {hash_val[:16]}...) is not equivalent")
    
    if equiv_flag:
        print(f"✓ Question verification successful - {len(equivalents)} design(s) are equivalent")
        return True, equivalents
    else:
        print(f"✗ Question verification failed - none of the {len(selected_designs)} unique designs are equivalent")
        return False, non_equivalents

if __name__ == "__main__":
    # Run the test
    pass
