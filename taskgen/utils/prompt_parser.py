from pathlib import Path
import json
from typing import Dict
import re

def get_prompt_json(prompt_file_path: Path):
    with open(prompt_file_path, 'r') as f:
        prompt_json: Dict[str, str] = json.loads(f.read())

    return prompt_json

def get_required_keys(prompt: str):
    keys = re.search(r"\{\{(\w+)\}\}", prompt)
    if not keys:
        return []
    return keys.group(1)

def load_prompt(prompt: str, key_dict: Dict[str, str]): 
    keys = re.search(r"\{\{(\w+)\}\}", prompt)
    if keys == None:
        return prompt

    for key in keys.group(1):
        prompt = prompt.replace(f"{{{{{keys}}}}}", key_dict[key])
    

def parse_prompt(prompt_file_path: Path):
    with open(prompt_file_path, 'r') as f:
        prompt_json: Dict[str, str] = json.loads(f.read())

    if "prompt" not in prompt_json.keys():
        raise ValueError(f"prompt not found in loaded JSON. filepath: {prompt_file_path}")



    prompt_base = prompt_json["prompt"]

    for k, v in prompt_json.items():
        if k == "prompt":
            continue
        prompt_base = prompt_base.replace("{{" + k + "}}", v)

    return prompt_base

TEST_PROMPT = Path("./prompts/example_prompt.json")

def test_prompt_parser():
    final_prompt = parse_prompt(TEST_PROMPT)
    prompt_json = get_prompt_json(TEST_PROMPT)
    keys = get_required_keys(prompt_json["prompt"])
    for k in keys:
        print(k)

    # print(final_prompt)

if __name__ == "__main__":
    test_prompt_parser()
