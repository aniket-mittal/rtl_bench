from utils.LLM_call import *
import yaml
import asyncio
import anthropic


async def test_claude(config):
    client = LLMClient((300,60), config["api_key"], config["claude_api_key"])
    test_msg = [{"role": "user", "content": "Hello"}]
    response = await client.call_claude(test_msg)
    print(response)
    return

async def test_gemini(config):
    client = LLMClient((300,60), config["api_key"], config["claude_api_key"], config["gemini_api_key"])
    test_msg = "Hello"
    response, (start_time, exec_time) = await client.call_gemini(test_msg)
    print(response)
    print(start_time, exec_time)
    return

def list_models(config):
    client = LLMClient((300,60), config["api_key"], config["claude_api_key"])
    for model in client.claude_models:
        print(model.id)

def main():
    asyncio.run(test_claude())

if __name__ == "__main__":
    with open("config.yaml", 'r') as f:
        config = yaml.safe_load(f)
    # main()
    # list_models(config)
    # asyncio.run(test_claude(config))
    asyncio.run(test_gemini(config))