import os
from dotenv import load_dotenv
import sys
import queue
from openai import OpenAI
import asyncio
from asynciolimiter import Limiter

rate_limiter = Limiter(120/60)
class DeepSeekClient:
    def __init__(self):
        load_dotenv()
        api_key = os.getenv("DEEPSEEK_API_KEY")
        self.api_key = api_key
        self.client = OpenAI(api_key=api_key, base_url="https://api.deepseek.com")

    async def generate(self, msgs, temperature=0.8, stream=False, q=None):
        await rate_limiter.wait()
        def sync_call():
            return self.client.chat.completions.create(
                model="deepseek-chat",
                messages=msgs,
                temperature=temperature,
                stream=stream
            )
        print("STARTING RESPONSE")
        response = await asyncio.to_thread(sync_call)
        print("RESPONSE RECEIVED")
        return response.choices[0].message.content
    def save(self, filepath, content, replace=False):
        os.makedirs(os.path.dirname(filepath), exist_ok=True)
        if os.path.exists(filepath) and replace == False:
            raise OSError(f"File {filepath} already exists!")
        with open(filepath, 'w') as f:
            f.write(content)
    
    async def generate_batch(self, msgs, n, temperature=0.8, stream=False):
        if isinstance(msgs[0], list):
            n = len(msgs)
            flat_msgs = msgs
        else:
            flat_msgs = [msgs] * n

        tasks = [asyncio.create_task(self.generate(msg, temperature=temperature, stream=stream)) for msg in flat_msgs[:n]]
        res = await asyncio.gather(*tasks)
        return res
        

