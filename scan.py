import os
import re
import sys

def scan(directory, pattern):
    regex = re.compile(pattern)
    
    for root, dirs, files in os.walk(directory):
        for file in files:
            if file.endswith(".txt"):
                file_path = os.path.join(root, file)
                with open(file_path, 'r') as f:
                    for line_number, line in enumerate(f, 1):
                        if regex.search(line):
                            print(f"{file_path}: {line_number}")

directory = sys.argv[1]
pattern = sys.argv[2]
scan(directory, pattern)
