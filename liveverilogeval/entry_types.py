from utils.hash_utils import hash_string
from utils.mutate import standardize
from collections import defaultdict
from typing import List, Dict
from pathlib import Path

class DesignEntry:
    """
    A class to represent a design entry with hash and equivalence group information.
    
    Attributes:
        hash: SHA256 hash of the design content
        equiv_id: Equivalence group identifier
    """
    def __init__(self, content: str, equiv_id: str=""):
        """
        Initialize a DesignEntry with content and optional equivalence ID.
        
        Args:
            content: The design content (e.g., Verilog code)
            equiv_id: Equivalence group ID. Defaults to hash if empty.
        """
        self.content = content
        self.hash = hash_string(self.content)
        self.equiv_id = equiv_id
        if equiv_id == "":
            self.equiv_id = self.hash
    
    def to_dict(self):
        """
        Convert the DesignEntry to a dictionary format.
        
        Returns:
            dict: Dictionary containing hash, equivalence_group, and content
        """
        return {
            'hash': self.hash,
            'equivalence_group': self.equiv_id,
            'content': getattr(self, 'content', '')
        }
    
    def __str__(self):
        """
        String representation of the DesignEntry.
        
        Returns:
            str: Formatted string with hash and equivalence ID
        """
        return f"DesignEntry(hash={self.hash[:16]}..., equiv_id={self.equiv_id})"
    
    def __repr__(self):
        """
        Detailed string representation for debugging.
        
        Returns:
            str: Detailed representation of the DesignEntry
        """
        return f"DesignEntry(hash='{self.hash}', equiv_id='{self.equiv_id}')" 

class QuestionEntry:
    def __init__(self, content: str, equiv_ids: set):
        """
        Initialize a QuestionEntry with content and equivalence ID.

        Args:
            content (str): The question content.
            equiv_ids (set): The equivalence group IDs associated with the question.
        """
        self.content = content
        self.equiv_ids = equiv_ids
        self.hash = hash_string(self.content)

    def to_dict(self):
        """
        Convert the QuestionEntry to a dictionary format.
        
        Returns:
            dict: Dictionary containing hash, equivalence_group, and content
        """
        return {
            'hash': self.hash,
            'equivalence_group': list(self.equiv_ids),
            'content': self.content
        }

    def __str__(self):
        """
        String representation of the QuestionEntry.

        Returns:
            str: Formatted string with hash and equivalence IDs
        """
        return f"QuestionEntry(hash={self.hash[:16]}..., equiv_ids={self.equiv_ids})"

    def __repr__(self):
        """
        Detailed string representation for debugging.

        Returns:
            str: Detailed representation of the QuestionEntry
        """
        return f"QuestionEntry(hash='{self.hash}', equiv_ids={self.equiv_ids})"

class Database:
    """
    Object holding all data in memory before/after loading to/from the JSONL files

    Properties:
        - designs are unique
        - designs are standardized
        - designs pass formal equivalence checks with itself
        - designs that are functionally equivalent have the same equiv_id

        - questions are unique
        - Each question equiv_id is shared with at least one other design
        - a question can have more than one equiv_id
    """
    def __init__(self):
        self.designs = defaultdict(list)
        self.questions = []
        self.question_search = defaultdict(list)
    
    def add_design(self, content: str, equiv_id: str="") -> bool:
        """
        Add a new design to the database.

        Args:
            content (str): The Verilog code or design content to be added.
            equiv_id (str, optional): The equivalence group ID for the design. 
                If not provided, it defaults to the hash of the standardized content.

        Returns:
            bool: True if the design was added successfully (i.e., it is new to the equivalence group), 
                  False if the design already exists in the group or if standardization fails.
        """
        try: 
            content = standardize(content)
        except Exception as _:
            return False

        hash_id = hash_string(content)
        if equiv_id == "":
            equiv_id = hash_id
        
        new_design = DesignEntry(content, equiv_id)

        if equiv_id not in self.designs:
            self.designs[equiv_id].append(new_design)
            return True
        else:
            for d in self.designs[equiv_id]:
                if d.hash == hash_id:
                    return False
            self.designs[equiv_id].append(new_design)
            return True
    
    def merge_equiv_groups(self, group_one: str, group_two: str):
        """
        Merge two equivalence groups into one.

        Args:
            group_one (str): First equivalence group ID
            group_two (str): Second equivalence group ID

        The group with the lexicographically smaller ID becomes the merged group.
        
        Returns:
            group: The merged group ID
        """
        assert group_one in self.designs
        assert group_two in self.designs
        
        print(f"Merging {group_one} and {group_two}")
        if group_one < group_two:
            for d in self.designs[group_two]:
                d.equiv_id = group_one
            self.designs[group_one].extend(self.designs[group_two])
            self.designs.pop(group_two, None)
            
            for q in self.question_search[group_two]:
                q.equiv_ids.discard(group_two)
                q.equiv_ids.add(group_one)
            self.question_search[group_one].extend(self.question_search[group_two])
            self.question_search.pop(group_two, None)
            return group_one
        else: 
            for d in self.designs[group_one]:
                d.equiv_id = group_two
            self.designs[group_two].extend(self.designs[group_one])
            self.designs.pop(group_one, None)
            
            for q in self.question_search[group_one]:
                q.equiv_ids.discard(group_one)
                q.equiv_ids.add(group_two)
            self.question_search[group_two].extend(self.question_search[group_one])
            self.question_search.pop(group_one, None)
            return group_two

    def add_question(self, content: str, equiv_ids: set) -> bool:
        """
        Add a new question to the database.

        Args:
            content (str): The question content to be added.
            equiv_ids (set): Set of equivalence group IDs for the question.

        Returns:
            bool: True if the question was added successfully, False if it already exists.

        Raises:
            ValueError: If any of the equivalence IDs are not found in the designs.
        """
        for equiv_id in equiv_ids:
            if equiv_id not in self.designs:
                raise ValueError(f"{equiv_id} is not an ID for any design group")

        hash_id = hash_string(content)
        
        if any(q.hash == hash_id for q in self.questions):
            return True
        
        new_question = QuestionEntry(content, equiv_ids)
        self.questions.append(new_question)
        
        for equiv_id in equiv_ids:
            self.question_search[equiv_id].append(new_question)
        
        return True 
    
    def get_questions_by_equiv_id(self, equiv_id: str) -> list:
        """
        Get all questions associated with a specific equivalence group ID.
        
        Args:
            equiv_id (str): The equivalence group ID to search for.
            
        Returns:
            list: List of QuestionEntry objects associated with the equivalence group.
        """
        return self.question_search.get(equiv_id, [])
    
    def write_db(self, design_file: str | Path, question_file: str | Path, replace: bool=False):
        """
        Write the current database of designs and questions to .jsonl files.

        Args:
            design_file (str | Path): Path to the output .jsonl file for designs.
            question_file (str | Path): Path to the output .jsonl file for questions.
            replace (bool): If True, overwrite existing files. If False, append to them.

        Each line in the output files will be a JSON object representing a design or question entry.
        """
        import json

        if isinstance(design_file, str):
            design_file = Path(design_file)
        if isinstance(question_file, str):
            question_file = Path(question_file)
        assert design_file.suffix == '.jsonl', f"design_file must be a .jsonl file, got {design_file}"
        assert question_file.suffix == '.jsonl', f"question_file must be a .jsonl file, got {question_file}"

        design_mode = 'w' if replace else 'a'
        question_mode = 'w' if replace else 'a'

        with open(design_file, design_mode, encoding='utf-8') as df:
            for group in self.designs.values():
                for design in group:
                    json.dump(design.to_dict(), df)
                    df.write('\n')

        with open(question_file, question_mode, encoding='utf-8') as qf:
            for question in self.questions:
                json.dump(question.to_dict(), qf)
                qf.write('\n')
    
    def read_db(self, design_file: str | Path, question_file: str | Path):
        """
        Read the database of designs and questions from .jsonl files.
        Ensures that duplicate hashes do not exist within each group.
        """
        import json

        if isinstance(design_file, str):
            design_file = Path(design_file)
        if isinstance(question_file, str):
            question_file = Path(question_file)
        assert design_file.suffix == '.jsonl', f"design_file must be a .jsonl file, got {design_file}"
        assert question_file.suffix == '.jsonl', f"question_file must be a .jsonl file, got {question_file}"

        self.designs = defaultdict(list)
        self.questions = []
        self.question_search = defaultdict(list)

        seen_design_hashes = set()
        if design_file.exists():
            with open(design_file, 'r', encoding='utf-8') as df:
                for line in df:
                    if not line.strip():
                        continue
                    entry = json.loads(line)
                    equiv_id = entry.get('equivalence_group', entry.get('equiv_id', ''))
                    content = entry.get('content', '')
                    design_entry = DesignEntry(content, equiv_id)
                    if design_entry.hash in seen_design_hashes:
                        continue
                    seen_design_hashes.add(design_entry.hash)
                    if any(d.hash == design_entry.hash for d in self.designs[equiv_id]):
                        continue
                    self.designs[equiv_id].append(design_entry)

        seen_question_hashes = set()
        if question_file.exists():
            with open(question_file, 'r', encoding='utf-8') as qf:
                for line in qf:
                    if not line.strip():
                        continue
                    entry = json.loads(line)
                    equiv_ids_data = entry.get('equivalence_group', entry.get('equiv_ids', []))
                    
                    if isinstance(equiv_ids_data, str):
                        equiv_ids = {equiv_ids_data}
                    elif isinstance(equiv_ids_data, list):
                        equiv_ids = set(equiv_ids_data)
                    else:
                        equiv_ids = set()
                    
                    content = entry.get('content', '')
                    question_entry = QuestionEntry(content, equiv_ids)
                    
                    if question_entry.hash in seen_question_hashes:
                        continue
                    seen_question_hashes.add(question_entry.hash)
                    
                    self.questions.append(question_entry)
                    
                    for equiv_id in equiv_ids:
                        self.question_search[equiv_id].append(question_entry)