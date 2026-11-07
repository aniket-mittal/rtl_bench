#!/usr/bin/env python3
"""
Script to count total valid questions generated where each question is unique 
to a design (tracked by original_design_hash) and mutant (mutant_index).
"""

import json
from collections import defaultdict

def count_unique_questions():
    """Count unique valid questions by design hash and mutant index."""
    
    # Set to store unique combinations of design_hash and mutant_index
    unique_combinations = set()
    
    # Counters for statistics
    total_questions = 0
    valid_questions = 0
    invalid_questions = 0
    
    # Read the questions file
    questions_file = "results/questions_gpt5.jsonl"
    
    try:
        with open(questions_file, 'r') as f:
            for line_num, line in enumerate(f, 1):
                line = line.strip()
                if not line:
                    continue
                    
                try:
                    data = json.loads(line)
                    total_questions += 1
                    
                    # Check if question is valid
                    if data.get('question_valid', False):
                        valid_questions += 1
                        
                        # Get the unique identifiers
                        design_hash = data.get('original_design_hash')
                        mutant_index = data.get('mutant_index')
                        
                        if design_hash and mutant_index is not None:
                            # Create unique key for this combination
                            unique_key = (design_hash, mutant_index)
                            unique_combinations.add(unique_key)
                        else:
                            print(f"Warning: Missing design_hash or mutant_index at line {line_num}")
                    else:
                        invalid_questions += 1
                        
                except json.JSONDecodeError as e:
                    print(f"Error parsing JSON at line {line_num}: {e}")
                    continue
                    
    except FileNotFoundError:
        print(f"Error: File {questions_file} not found")
        return
    except Exception as e:
        print(f"Error reading file: {e}")
        return
    
    # Print results
    print("=== Question Statistics ===")
    print(f"Total questions processed: {total_questions}")
    print(f"Valid questions: {valid_questions}")
    print(f"Invalid questions: {invalid_questions}")
    print(f"Unique valid questions (by design_hash + mutant_index): {len(unique_combinations)}")
    
    # Show breakdown by design hash
    design_counts = defaultdict(int)
    for design_hash, mutant_index in unique_combinations:
        design_counts[design_hash] += 1
    
    print(f"\nUnique designs with questions: {len(design_counts)}")
    print(f"Average questions per design: {len(unique_combinations) / len(design_counts):.2f}")
    
    # Show top designs by question count
    print("\nTop 5 designs by question count:")
    sorted_designs = sorted(design_counts.items(), key=lambda x: x[1], reverse=True)
    for i, (design_hash, count) in enumerate(sorted_designs[:5], 1):
        print(f"  {i}. {design_hash[:16]}...: {count} questions")

if __name__ == "__main__":
    count_unique_questions()
