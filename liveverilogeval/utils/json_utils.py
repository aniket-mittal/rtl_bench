import json

PROMPT_JSON = "preliminary_EXP/7420/prompt.json"
OUTPUT_TXT = "generated_prompt.txt"

"""
prompt.json template:
{
    "description" : "The 7400-series integrated circuits are a series of digital chips with a few gates each. The 7420 is a chip with two 4-input NAND gates.    Create a module with the same functionality as the 7420 chip. It has 8 inputs and 2 outputs.",
}
"""
def json_read(filename):
    with open(filename, 'r') as f:
        data = json.load(f)
    return data

def txt_write(filename, content):
    with open(filename, 'w') as f:
        f.write(content)

def prompt_gen_from_jsonprompt(json_data):
    prompt_header = "You are a very creative hardware description mutator. Given a hardware module's specifications, Generate a new specification following the original format that describes a similar design that does something completely different.\n"
    prompt_description = "The hardware specification is: '%s'\n" % (json_data["description"])
    prompt = prompt_header + prompt_description
    return prompt

def main():
    json_file = PROMPT_JSON
    output_txt = OUTPUT_TXT
    json_data = json_read(json_file)
    prompt = prompt_gen_from_jsonprompt(json_data)
    txt_write(output_txt, prompt)

if __name__ == "__main__":
    main()
