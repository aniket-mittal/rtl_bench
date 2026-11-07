from pathlib import Path
from typing import List
import tempfile
import asyncio
import os
async def test_dut(dut_filepath: Path, tb_filepath: Path, dependencies: List[Path]=[], custom_executable: str="a.out", timeout=1, debug=False, tempdir=True):
    def LOG(msg):
        if debug:
            print(msg)

    if tempdir:
        temp_dir = tempfile.TemporaryDirectory()
        work_dir = Path(temp_dir.name)
        custom_executable = str(work_dir / custom_executable)
    else:
        work_dir = None

    icarus_compiler = 'iverilog'
    icarus_synthesizer = 'vvp'

    dut_compile_cmd = [icarus_compiler, "-g2012", "-o", custom_executable, dut_filepath]
    try:
        dut_process = await asyncio.create_subprocess_exec(
            *dut_compile_cmd,
            stdout=asyncio.subprocess.PIPE,
            stderr=asyncio.subprocess.PIPE,
            limit=timeout
        )
        dut_result = await dut_process.communicate()
        if dut_process.returncode != 0:
            LOG(f"ERROR: {dut_filepath} does not compile by itself.\n{dut_result[1]}")
            return 4
    except Exception as e:
        LOG(f"ERROR compiling {dut_filepath} standalone: {e}")
        return 4
    command = [icarus_compiler, "-g2012", "-o", custom_executable, tb_filepath, dut_filepath]
    command.extend(dependencies)
    try:
        # Run the command
        process = await asyncio.create_subprocess_exec(*command,
                                                       stdout=asyncio.subprocess.PIPE,
                                                       stderr=asyncio.subprocess.PIPE,
                                                       limit=timeout)
        result = await process.communicate()
    except Exception as e:
        LOG(f"ERROR compiling {dut_filepath}: {e}")
        return 3
    if "FAULT" in result[0].decode() or len(result[1].decode()) > 0:
        LOG(f"ERROR compiling {dut_filepath}: {result[1].decode()}")
        return 3
    LOG(f"Successfully compiled {dut_filepath} to {custom_executable}")

    try:
        process = await asyncio.create_subprocess_exec(*[icarus_synthesizer, custom_executable],
                                                 stdout=asyncio.subprocess.PIPE,
                                                 stderr=asyncio.subprocess.PIPE,
                                                 limit=timeout)
        result = await process.communicate()
    except Exception as e:
        LOG(f"ERROR executing {dut_filepath}: {e}")
        return 2
    print(len(result[0]), len(result[1]))
    if len(result[1].decode()) > 0:
        LOG(f"ERROR executing {dut_filepath}: {result[1].decode()}")
        return 2
    if "FAULT" in result[0].decode(): 
        LOG(f"ERROR: bug found in synthesis output of {dut_filepath}")
        return 1
    return 0

def clean_verilog_files(directory, extension=".v"):
    for root, _, files in os.walk(directory):
        for file in files:
            if file.endswith(extension):  # Assuming Verilog files have .v extension
                file_path = os.path.join(root, file)
                clean_file(file_path)

def clean_file(file_path):
    start = False
    print(file_path)
    with open(file_path, 'r') as f:
        lines = f.readlines()
    with open(file_path, 'w') as f:
        for line in lines:
            if line.strip().startswith("```") or line.strip().startswith("---"):
                start = not start
            elif start:
                f.write(line)

def extract_code(content: str) -> str:
    start = False
    lines = content.split('\n')
    res = []
    for line in lines:
        if line.strip().startswith("```") or line.strip().startswith("---"):
            start = not start
        elif start:
            res.append(line)
    return "\n".join(res)
    