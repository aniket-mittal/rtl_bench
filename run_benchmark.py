import json
import asyncio
from utils.LLM_call import LLMClient
from utils.config import Config
from utils.equivalence_check import check_equivalence
from utils.generators import AnswerGenerator
from entry_types import DesignEntry

async def main():
    questions = []
    correct_answers = []
    pass_one_acc = 0
    pass_five_acc = 0
    with open("./results/questions.jsonl", "r") as f:
        for line in f:
            data = json.loads(line)
            if data['question_valid']:
                questions.append(DesignEntry(data['question_text']))
                correct_answers.append(data['mutant_code'])

    config = Config("config.yaml")
    client = LLMClient(config)

    ags = []
    for question in questions:
        ags.append(AnswerGenerator(question.content, client))

    print(f"Generating {5*len(questions)} answers for {len(questions)} questions")
    task_answers = [ag.generate_answers(5) for ag in ags]
    answers = await asyncio.gather(*task_answers)
    print("Answers generated")

    for i in range(len(answers)):
        print(f"Checking answer {i+1} of {len(answers)}")
        first = True
        for answer in answers[i]:
            correct = await check_equivalence(config.batch_dir_path, answer , correct_answers[i])
            if correct:
                if first:
                    pass_one_acc += 1
                pass_five_acc += 1
                break
            first = False
    print(f"Pass 1 accuracy: {pass_one_acc / len(answers)}")
    print(f"Pass 5 accuracy: {pass_five_acc / len(answers)}")

if __name__ == "__main__":
    asyncio.run(main())