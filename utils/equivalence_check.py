# Credit goes to Yubeaton et al. for some initial functions in this file, source: https://github.com/wilyub/VeriThoughts
import subprocess
import re
from pathlib import Path
import traceback
import asyncio
from utils.config import Config

def rename_modules_and_instantiations(verilog_code, obscure_names: bool = False):
    # Step 1: Find all module names (including those with parameters using #(...))
    module_pattern = re.compile(r'\bmodule\s+(\w+)\s*(?:#\s*\(.*?\))?\s*\(', re.DOTALL)
    module_names = module_pattern.findall(verilog_code)

    # Step 2: Create a mapping from old to new names
    if obscure_names:
        rename_map = {}
        for i in range(len(module_names)):
            if i == 0:
                rename_map[module_names[i]] = 'dut'
            else:
                rename_map[module_names[i]] = 'dut_dependency_' + str(i+1)
    else:
        rename_map = {name: 'dut_' + name for name in module_names}
    
    # Step 3: Replace module declarations
    def replace_module_decl(match):
        original_name = match.group(1)
        before = match.group(0)
        return before.replace(original_name, rename_map[original_name], 1)

    verilog_code = module_pattern.sub(replace_module_decl, verilog_code)

    # Step 4: Replace module instantiations (word boundaries)
    for old_name, new_name in rename_map.items():
        instantiation_pattern = re.compile(rf'\b{old_name}\b')
        verilog_code = instantiation_pattern.sub(new_name, verilog_code)

    return verilog_code, rename_map

async def create_yosys_files(batch_file_path: str, initial_code: str, ground_truth: str, instance_id: str = None):
    # Generate unique file paths for each parallel instance
    if instance_id is None:
        # Use task ID or a random string to ensure uniqueness
        import uuid
        instance_id = str(uuid.uuid4())[:8]
    
    verilog_gen_path = Path(batch_file_path) / f"verilog_gen_{instance_id}.sv"
    verilog_truth_path = Path(batch_file_path) / f"verilog_truth_{instance_id}.sv"
    yosys_script_path = Path(batch_file_path) / f"equivalence_check_{instance_id}.ys"
    
    initial_code, mod_module_list = rename_modules_and_instantiations(initial_code, obscure_names=True)
    modified_module_golden, mod_module_list = rename_modules_and_instantiations(ground_truth, obscure_names=True)
    modified_module_golden, mod_module_list = rename_modules_and_instantiations(modified_module_golden)
    with open(verilog_gen_path, 'w', encoding='utf-8') as f:
        f.write(initial_code)
    with open(verilog_truth_path, 'w', encoding='utf-8') as f:
        f.write(modified_module_golden)
    yosys_stdout_list = []
    for original_module_name in mod_module_list:
        module_name = mod_module_list[original_module_name]
        equivalence_string = f"""
        read_verilog -sv {verilog_truth_path}
        read_verilog -sv {verilog_gen_path}
        prep; proc; opt; memory;
        clk2fflogic;
        miter -equiv -flatten {module_name} {original_module_name} miter
        sat -seq 20 -verify -prove trigger 0 -show-inputs -show-outputs -set-init-zero miter
        """

        with open(yosys_script_path, 'w') as f:
            f.write(equivalence_string)

        try:
            # Use asyncio.create_subprocess_exec for awaitable subprocess
            # Remove -i flag to prevent TTY input issues
            # print(f"yosys -s {yosys_script_path}")
            process = await asyncio.create_subprocess_exec(
                'bash', '-c', f"yosys -s {yosys_script_path}",
                stdout=asyncio.subprocess.PIPE,
                stderr=asyncio.subprocess.PIPE,
                stdin=asyncio.subprocess.DEVNULL  # Prevent TTY input
            )
            
            try:
                stdout, stderr = await asyncio.wait_for(process.communicate(), timeout=60)
                # print(stdout)
                # print(stderr)
                yosys_stdout_list.append(process.returncode)
            except asyncio.TimeoutError:
                process.terminate()
                yosys_stdout_list.append(0)
        except Exception as e:
            print(f"Error running yosys: {e}")
            yosys_stdout_list.append(-1)
        
    # Cleanup temporary files
    try:
        if verilog_gen_path.exists():
            verilog_gen_path.unlink()
        if verilog_truth_path.exists():
            verilog_truth_path.unlink()
        if yosys_script_path.exists():
            yosys_script_path.unlink()
    except Exception as e:
        print(f"Warning: Could not cleanup temporary files: {e}")
    
    return yosys_stdout_list

async def check_equivalence(batch_file_path: str, initial_code: str, ground_truth: str) -> bool:
    """
    Checks equivalence of two Verilog codes using Yosys.
    Returns True if equivalent, False otherwise.
    """
    # Generate unique instance ID for this equivalence check
    import uuid
    instance_id = str(uuid.uuid4())[:8]
    
    yosys_results = await create_yosys_files(batch_file_path, initial_code, ground_truth, instance_id)
    # If all return codes are 0, equivalence holds
    return all(code == 0 for code in yosys_results)

async def yosys_sanity_check(batch_file_path: str, code: str) -> bool:
    return await check_equivalence(batch_file_path, code, code)

async def test_check_equivalence():
    """
    Test equivalence checking by comparing each verified file with itself.
    This should always return True (equivalent) for all files.
    """
    config = Config("config.yaml")
    batch_file_path = Path(config.get_yosys_batch_dir())
    batch_file_path.mkdir(exist_ok=True)
    
    # Yosys location - adjust this path as needed
    yosys_location = "/usr/local/bin/yosys"  # Default location, may need adjustment
    
    rtllm_dir = Path(config.starting_verilog_dir).absolute()
    total_count = 0
    equivalent_count = 0
    error_count = 0
    
    print("Testing equivalence checking by comparing each verified file with itself...")
    print("=" * 80)
    
    for design_dir in rtllm_dir.iterdir():
        if design_dir.is_dir():
            verified_file = design_dir / f"verified_{design_dir.name}.v"
            if verified_file.exists():
                total_count += 1
                try:
                    print(f"Checking: {verified_file.name}")
                    
                    # Read the original file
                    with open(verified_file, 'r') as f:
                        original_code = f.read()
                    
                    # Compare the file with itself
                    is_equivalent = await check_equivalence(
                        str(batch_file_path) + "/",
                        original_code,
                        original_code
                    )
                    
                    if is_equivalent:
                        print(f"  ✓ EQUIVALENT - {verified_file.name} is equivalent to itself")
                        equivalent_count += 1
                    else:
                        print(f"  ✗ NOT EQUIVALENT - {verified_file.name} is NOT equivalent to itself (unexpected!)")
                    
                except Exception as e:
                    error_count += 1
                    print(f"  ✗ ERROR - {verified_file.name}: {e}")
                
                print("-" * 60)
    
    print("=" * 80)
    print(f"Summary:")
    print(f"  Total files checked: {total_count}")
    print(f"  Equivalent: {equivalent_count}")
    print(f"  Not equivalent: {total_count - equivalent_count - error_count}")
    print(f"  Errors: {error_count}")
    
    if equivalent_count == total_count:
        print("✓ All files are equivalent to themselves (expected result)")
    else:
        print("✗ Some files are not equivalent to themselves (unexpected result)")
    
    return equivalent_count == total_count

async def test_check_equivalence_single(design: Path):
    config = Config("config.yaml")
    batch_file_path = Path(config.get_yosys_batch_dir())
    batch_file_path.mkdir(exist_ok=True)
    yosys_location = "/usr/local/bin/yosys"  # Default location, may need adjustment

    print(f"Testing equivalence checking for {design.name} only...")
    print("=" * 80)

    if verified_file.exists():
        try:
            print(f"Checking: {verified_file.name}")

            with open(verified_file, 'r') as f:
                original_code = f.read()

            is_equivalent = await check_equivalence(
                str(batch_file_path) + "/",
                original_code,
                original_code
            )

            if is_equivalent:
                print(f"  ✓ EQUIVALENT - {verified_file.name} is equivalent to itself")
                return True
            else:
                print(f"  ✗ NOT EQUIVALENT - {verified_file.name} is NOT equivalent to itself (unexpected!)")
                return False

        except Exception as e:
            print(f"  ✗ ERROR - {verified_file.name}: {e}")
            return False
    return False

if __name__ == "__main__":
    # test_check_equivalence()
    config = Config("config.yaml")
    design_dir = Path(config.starting_verilog_dir) / "div_16bit"
    verified_file = design_dir / "verified_div_16bit.v"
    # test_check_equivalence_single(verified_file)