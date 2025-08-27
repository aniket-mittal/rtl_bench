from openai import OpenAI
from typing import List, Dict, Tuple, Optional
import asyncio
import time
import yaml
from pathlib import Path
from asynciolimiter import Limiter
import anthropic
from google import genai
from utils.config import Config
import random
from pydantic import BaseModel


def extract_between_markers(text: str, begin_marker: str, end_marker: str) -> str:
    start_idx = text.find(begin_marker)
    if start_idx == -1:
        return text.strip()
    start_idx += len(begin_marker)
    text = text[start_idx:]
    end_idx = text.find(end_marker)
    return text[:end_idx].strip()

class LLMClient:
    """Client class for interacting with LLMs
        Args:
        config - Config object containing API keys and other configuration
    """
    def __init__(self, config: Config) -> None:
        """Init class

        Args:
        config - Config object containing API keys and other configuration
        """
        self.limiter = Limiter(config.calls_per_min/60)
        self.deepseek_client = OpenAI(api_key=config.deepseek_api_key, base_url="https://api.deepseek.com")
        self.claude_client = anthropic.Anthropic(api_key=config.claude_api_key)
        self.claude_models = [model_id.id for model_id in self.claude_client.models.list(limit=20)]
        self.gemini_client = genai.Client(api_key=config.gemini_api_key)
        self.gemini_models = ["gemini-2.5-flash", "gemini-2.5-pro", "gemini-2.0-flash", "gemini-2.5-flash-lite"]
        self.gpt_client = OpenAI(api_key=config.gpt_api_key, base_url="https://api.openai.com/v1")
        self.gpt_models = ["gpt-5", "gpt-4o-mini"]

    async def call(self, msg: str | List[Dict[str, str]], model: str="deepseek", model_id: str="", temperature: float=0.8, gpt_json_schema: Optional[BaseModel] = None) -> None:
        if model == "deepseek":
            if isinstance(msg, str):
                messages = [{"role": "user", "content": msg}]
            else:
                messages = msg
            return await self.call_deepseek(messages, model_id, temperature)
        elif model == "claude":
            if isinstance(msg, str):
                messages = [{"role": "user", "content": msg}]
            else:
                messages = msg
            return await self.call_claude(messages, model_id)
        elif model == "gemini":
            if isinstance(msg, list):
                msg = "\n".join([f"{m['content']}" for m in msg])
            return await self.call_gemini(msg, model_id)
        elif model == "gpt":
            return await self.call_gpt(msg, model_id, gpt_json_schema)
        elif model == "random":
            return await self.call_random(msg, model_id, temperature)
        else:
            raise ValueError(f"Invalid model: {model}, valid models: deepseek, claude, gemini")

    async def call_random(self, msg: str, model_id: str="", temperature: float=0.8) -> None:
        model = random.choice(["deepseek", "claude", "gemini"])
        return await self.call(msg, model, model_id, temperature)

    async def call_claude(self, msgs: str, model_id: str=""):
        """Generate something w/ Claude
        """
        # TODO: if rate limit exceeded, wait for 
        if model_id and model_id not in self.claude_models:
            raise ValueError(f"Invalid model ID: {model_id}, valid models: {self.claude_models}")
        if not model_id:
            model_id = self.claude_models[0]
        await self.limiter.wait()
        def sync_call():
            start_time = time.time()
            res = self.claude_client.messages.create(
                max_tokens=10,
                model=model_id,
                messages=msgs,
            )
            end_time = time.time()
            execution_time = end_time - start_time
            return res, start_time, execution_time
        response, start_time, exec_time = await asyncio.to_thread(sync_call)
        answer = response.content[0].text
        return answer, response.usage.output_tokens

    async def call_gemini(self, msgs: str, model_id: str=""):
        """Generate something w/ Gemini
        """
        if model_id and model_id not in self.gemini_models:
            raise ValueError(f"Invalid model ID: {model_id}, valid models: {self.gemini_models}")
        if not model_id:
            model_id = "gemini-2.5-flash-lite"
        await self.limiter.wait()
        def sync_call():
            start_time = time.time()
            res = self.gemini_client.models.generate_content(
                model=model_id,
                contents=msgs,
            )
            end_time = time.time()
            execution_time = end_time - start_time
            return res, start_time, execution_time
        response, start_time, exec_time = await asyncio.to_thread(sync_call)
        answer = response.text
        response_metadata = response.usage_metadata
        return answer, response_metadata.candidates_token_count

    async def call_deepseek(self, msgs, model_id: str="", reasoner: bool=False, temperature: float=0.6):
        """Generate something w/ Deepseek

        Args:
        msgs - what to input to the LLM (Example: [{"role": "system", "content": "Hello"}])
        reasoner - whether or not to use the deepseek-reasoner model
        """
        await self.limiter.wait()
        def sync_call():
            start_time = time.time()
            res = self.deepseek_client.chat.completions.create(
                model="deepseek-chat",
                messages=msgs,
                temperature=temperature,
            )
            end_time = time.time()
            execution_time = end_time - start_time
            return res, start_time, execution_time
        response, start_time, exec_time = await asyncio.to_thread(sync_call)
        answer = response.choices[0].message.content
        if answer == None:
            raise ValueError("Deepseek API Call Failed!")
        system_fingerprint = response.system_fingerprint
        usage = {"completion_tokens": response.usage.completion_tokens, "prompt_tokens": response.usage.prompt_tokens, "total_tokens": response.usage.total_tokens}
        model = response.model
        response_metadata = {"messages": msgs, "call_time": start_time, "execution_time": exec_time, "system_fingerprint": system_fingerprint, "model": model, "usage": usage}
        return (answer, response_metadata["usage"]["completion_tokens"])

    async def call_gpt(self, msgs: str, model_id: str="", gpt_json_schema: Optional[BaseModel] = None):
        """Generate something w/ GPT
        """
        if model_id and model_id not in self.gpt_models:
            raise ValueError(f"Invalid model ID: {model_id}, valid models: {self.gpt_models}")
        if not model_id:
            model_id = "gpt-5"
        await self.limiter.wait()
        def sync_call():
            if gpt_json_schema:
                start_time = time.time()
                res = self.gpt_client.responses.parse(
                    model=model_id,
                    input=msgs,
                    text_format=gpt_json_schema,
                )
                return res.output_parsed, res.usage.output_tokens
            else:
                res = self.gpt_client.responses.create(
                    model=model_id,
                    input=msgs,
                )
                return res.output_text, res.usage.output_tokens
        response, usage = await asyncio.to_thread(sync_call)
        return response, usage


async def test():
    config = Config("config.yaml")
    client = LLMClient(config)
    test_msg = [{"role": "system", "content": "Hello"}]
    response, metadata = await client.call(test_msg, model="deepseek", model_id="")
    print(response)
    print("------------------------------------")
    print(metadata)
    return


if __name__ == "__main__":
    asyncio.run(test())


