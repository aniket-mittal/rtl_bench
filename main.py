from utils.generators import create_generators, DebugLogger
from entry_types import DesignEntry, Database
from utils.LLM_call import LLMClient
import asyncio
import json
from pathlib import Path
from utils.config import Config

async def run():
    config = Config("config.yaml")
    client = LLMClient(config)

    with open(config.original_designs_path, "r") as f:
        data = [json.loads(line) for line in f]

    debug_enabled, debug_log_file = config.get_debug_settings()

    # Create output directory for results
    output_dir = Path("./results")
    output_dir.mkdir(exist_ok=True)

    tasks = [
        process_single_design(design["content"], client, config) for design in data
    ]
    print(f"Processing {len(tasks)} designs with mutation pipeline")
    results = await asyncio.gather(*tasks)
    
    # Flatten all questions from all designs into a single list
    all_questions = []
    successful_designs = 0
    failed_designs = 0
    
    for result in results:
        if "error" in result:
            failed_designs += 1
            continue
        
        successful_designs += 1
        if "questions" in result:
            all_questions.extend(result["questions"])
    
    # Save flattened questions to JSONL file
    with open(config.output_path, "w") as f:
        for question in all_questions:
            f.write(json.dumps(question, ensure_ascii=False) + "\n")
    
    # Print summary
    print(f"\nSummary:")
    print(f"  Total designs processed: {len(results)}")
    print(f"  Successful: {successful_designs}")
    print(f"  Failed: {failed_designs}")
    print(f"  Total questions generated: {len(all_questions)}")
    
    return all_questions

async def process_single_design(verilog_code: str, client: LLMClient, config: Config):
    """Process a single design through the complete mutation and question generation pipeline."""
    design_entry = DesignEntry(verilog_code)
    
    print(f"\nProcessing design: {design_entry.hash}")
    print("-" * 60)
    
    try:
        # Create all generators
        qg, ag, vqg, mg, mutg = create_generators(
            design_entry=design_entry,
            client=client,
            config=config
        )
        
        print("  Generating bug categories...")
        bug_categories = await mg.generate_bug_categories(temperature=0.7)
        print(f"  Generated {len(bug_categories)} bug categories")
        
        print("  Generating mutants...")
        mutants = await mutg.generate_mutants(bug_categories, temperature=0.8)
        print(f"  Generated {len(mutants)} mutants")

        print("  Generating questions for each mutant...")
        async def generate_questions_for_mutant(mutant_data, mutant_index):
            """Generate questions for a single mutant."""
            mutant_code, bug_type = mutant_data
            print(f"    Processing mutant {mutant_index + 1} (bug: {bug_type})...")
            
            # Create a new design entry for the mutant
            mutant_design_entry = DesignEntry(mutant_code)
            
            # Create generators for the mutant
            mutant_qg, mutant_ag, mutant_vqg, _, _ = create_generators(
                design_entry=mutant_design_entry,
                client=client,
                config=config
            )
            
            # Generate questions for this mutant in parallel
            question_tasks = [mutant_qg.generate(temperature=0.6) for _ in range(config.questions_n)]
            
            try:
                questions = await asyncio.gather(*question_tasks, return_exceptions=True)

                # Prepare validation tasks for all questions
                validation_tasks = []
                valid_question_generators = []
                for j, question in enumerate(questions):
                    if isinstance(question, Exception):
                        print(f"      Error generating question {j+1}: {question}")
                        validation_tasks.append(None)
                        valid_question_generators.append(None)
                        continue
                    
                    question_design_entry = DesignEntry(mutant_code)
                    
                    question_qg, question_ag, question_vqg, _, _ = create_generators(
                        design_entry=question_design_entry,
                        client=client,
                        config=config
                    )
                    
                    # Set the question for the answer generator
                    question_ag.question = question
                    
                    valid_question_generators.append((question_vqg, question_ag, question, j))
                    validation_tasks.append(question_vqg.validate())

                # Run all validations in parallel (skip None entries)
                results = []
                if validation_tasks:
                    # Only run asyncio.gather on non-None tasks
                    filtered_tasks = [task for task in validation_tasks if task is not None]
                    validation_results = await asyncio.gather(*filtered_tasks, return_exceptions=True)
                else:
                    validation_results = []

                mutant_questions = []
                result_idx = 0
                for idx, vqg_tuple in enumerate(valid_question_generators):
                    if vqg_tuple is None:
                        continue  # This was an exception in question generation
                    question_vqg_instance, question_ag_instance, question, j = vqg_tuple
                    validation_result = validation_results[result_idx]
                    result_idx += 1
                    
                    try:
                        if isinstance(validation_result, Exception):
                            raise validation_result
                        
                        # The answers were already generated during validation
                        # We need to access them from the ValidQuestionGenerator
                        # Since validate() was called, the answers are stored in the AnswerGenerator
                        # but we need to get them from the validation process
                        
                        # Create question dictionary with all required information
                        question_dict = {
                            "question_valid": question_vqg_instance.valid_question,
                            "question_text": question,
                            "mutant_code": mutant_code,
                            "bug_type": bug_type,
                            "original_code": design_entry.content,
                            "original_design_hash": design_entry.hash,
                            "answers": question_vqg_instance.generated_answers,  # Use answers from validation
                            "question_number": j + 1,
                            "mutant_index": mutant_index + 1
                        }
                        
                        mutant_questions.append(question_dict)
                        print(f"      Completed question {j+1} with validation")
                        
                    except Exception as e:
                        print(f"      Error processing question {j+1}: {e}")
                        # Add question with error information
                        question_dict = {
                            "question_valid": False,
                            "question_text": question,
                            "mutant_code": mutant_code,
                            "bug_type": bug_type,
                            "original_code": design_entry.content,
                            "original_design_hash": design_entry.hash,
                            "answers": [],
                            "validation_result": False,
                            "question_number": j + 1,
                            "mutant_index": mutant_index + 1,
                            "error": str(e)
                        }
                        mutant_questions.append(question_dict)
                        continue
                
                print(f"    Generated {len(mutant_questions)} questions for mutant {mutant_index + 1}")
                return mutant_questions
                
            except Exception as e:
                print(f"    Error processing mutant {mutant_index + 1}: {e}")
                return []
        
        # Process all mutants in parallel
        mutant_tasks = [
            generate_questions_for_mutant(mutant_data, i) 
            for i, mutant_data in enumerate(mutants)
        ]
        
        all_questions_lists = await asyncio.gather(*mutant_tasks, return_exceptions=True)
        
        # Flatten the results
        all_questions = []
        for questions_list in all_questions_lists:
            if isinstance(questions_list, Exception):
                print(f"  Error processing mutant: {questions_list}")
                continue
            all_questions.extend(questions_list)
        
        # Store comprehensive results
        result = {
            "design_hash": design_entry.hash,
            "original_code": verilog_code,
            "bug_categories": bug_categories,
            "mutants": [
                {
                    "bug_type": bug_type,
                    "mutant_code": mutant_code,
                    "code_length": len(mutant_code)
                }
                for mutant_code, bug_type in mutants
            ],
            "questions": all_questions,
            "total_mutants": len(mutants),
            "total_questions": len(all_questions),
            "timestamp": asyncio.get_event_loop().time()
        }
        
        print(f"  ✓ Successfully processed design with {len(mutants)} mutants and {len(all_questions)} questions")
        return result
        
    except Exception as e:
        print(f"  ✗ Error processing design: {e}")
        return {
            "design_hash": design_entry.hash,
            "error": str(e),
            "timestamp": asyncio.get_event_loop().time()
        }

async def test_mutation_pipeline():
    """Test the complete mutation pipeline on sample designs."""
    
    config = Config("config.yaml")
    client = LLMClient(config)
    
    # Sample designs to test
    sample_designs = [
        {
            "name": "8-bit Adder",
            "content": """module adder_8bit(
    input [7:0] a,
    input [7:0] b,
    input cin,
    output [7:0] sum,
    output cout
);
    assign {cout, sum} = a + b + cin;
endmodule"""
        },
        {
            "name": "4-bit Counter",
            "content": """module counter_4bit(
    input clk,
    input reset,
    input enable,
    output reg [3:0] count
);
    always @(posedge clk or posedge reset) begin
        if (reset)
            count <= 4'b0000;
        else if (enable)
            count <= count + 1'b1;
    end
endmodule"""
        }
    ]
    
    print(f"Testing mutation pipeline on {len(sample_designs)} sample designs...")
    print("=" * 80)
    
    design_entry = DesignEntry(sample_designs[0]["content"])

    # Create all generators
    qg, ag, vqg, mg, mutg = create_generators(
        design_entry=design_entry,
        client=client,
        config=config
    )
    
    # Generate bug categories
    print("  Generating bug categories...")
    bug_categories = await mg.generate_bug_categories(temperature=0.7)
    print(f"  Generated {len(bug_categories)} bug categories")
    
    # Generate mutants
    print("  Generating mutants...")
    mutants = await mutg.generate_mutants(bug_categories, temperature=0.8)
    print(f"  Generated {len(mutants)} mutants")
    
    # Generate questions for each mutant in parallel
    print("  Generating questions for each mutant...")
    q_tasks = [qg.generate(temperature=0.6) for _ in range(2)]
    questions = await asyncio.gather(*q_tasks, return_exceptions=True)



    for question in questions:
        print(question)

    # Validate questions
    v_tasks = [vqg.validate() for _ in range(2)]
    v_results = await asyncio.gather(*v_tasks, return_exceptions=True)
    for v_result in v_results:
        print(v_result)
        print("-" * 50)

    return questions

if __name__ == "__main__":
    print("Comprehensive Design Processing Pipeline")
    print("=" * 50)
    print("This pipeline will:")
    print("1. Load designs from data/designs.jsonl")
    print("2. Generate bug categories for each design")
    print("3. Generate 4 mutants for each design")
    print("4. Generate 3 questions for each mutant")
    print("5. Save results to results/comprehensive_results.jsonl")
    print("=" * 50)
    
    # Run the main pipeline
    # asyncio.run(run())
    
    # Uncomment to run the test pipeline instead
    asyncio.run(test_mutation_pipeline())