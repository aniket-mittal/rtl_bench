import hashlib

def hash_file(file_path: str) -> str:
    """
    Hashes a file and returns the hash as a string.
    """
    with open(file_path, 'rb') as f:
        return hashlib.sha256(f.read()).hexdigest()

def hash_string(string: str) -> str:
    """
    Hashes a string and returns the hash as a string.
    """
    return hashlib.sha256(string.encode()).hexdigest()