from utils.llm_prompt import DeepSeekClient
import subprocess
from pathlib import Path

TB_WRITE_PROMPT_PATH = Path(__file__).parent / 'tb_write_prompt.txt'

class DutTbGenerator:
    def __init__(self):
        self.client = DeepSeekClient()
        self.tb_prompt = ""
        self.dut_prompt = ""
    
    def write_tb_prompt(self, dut_desc):
        file_path = TB_WRITE_PROMPT_PATH
        with file_path.open('r') as f:
            prompt = f.read()
        messages = [
            {"role":"system", "content":prompt},
            {"role":"user", "content": dut_desc}
        ]
        self.tb_prompt = self.client.generate(messages)
        return self.tb_prompt
        
    def generate_tb(self, tb_prompt):
        pass
    
    def generate_dut(self):
        pass
    
