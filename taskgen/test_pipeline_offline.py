"""
Offline end-to-end test of main.process_single_design with a scripted fake LLM
and real Yosys. Needs yosys + iverilog, no API keys. Run from the repo root:
    python -W ignore test_pipeline_offline.py
"""
import asyncio
import json
import sys
import tempfile
from pathlib import Path

sys.path.insert(0, ".")
from main import process_single_design
from utils.config import Config
from utils.generators import BugCategories, BugCategory

ORIGINAL = """module counter(input clk, input rst, output reg [3:0] q);
always @(posedge clk or posedge rst) if (rst) q <= 4'd0; else q <= q + 4'd1;
endmodule"""

WRAP13 = """module counter(input clk, input rst, output reg [3:0] q);
always @(posedge clk or posedge rst) if (rst) q <= 4'd0; else if (q == 4'd13) q <= 4'd0; else q <= q + 4'd1;
endmodule"""

WRAP13_REWRITE = """module counter(input clk, input rst, output [3:0] q);
reg [3:0] r; assign q = r;
always @(posedge clk or posedge rst) begin
  if (rst) r <= 4'd0;
  else r <= (r >= 4'd13) ? 4'd0 : r + 4'd1;
end
endmodule"""

BROKEN = """module counter(input clk, input rst, output reg [3:0] q
always @(posedge clk) q <= 1;
endmodule"""

MUTANTS = {"wrap at 13": WRAP13, "no-op change": ORIGINAL,
           "wrap at 13 (rewritten)": WRAP13_REWRITE, "syntax slip": BROKEN}

QUESTION = ("Design module dut with inputs clk, rst (async active-high reset) and a 4-bit "
            "output q. q counts up by one on each rising clock edge and returns to 0 "
            "after reaching 13.")


class FakeClient:
    def __init__(self):
        self.answer_prompts = []
        self.answer_calls = 0

    async def call(self, msgs, model="deepseek", model_id="", temperature=0.8, gpt_json_schema=None):
        text = "\n".join(m["content"] for m in msgs) if isinstance(msgs, list) else msgs
        if gpt_json_schema is not None:  # bug categories
            cats = [BugCategory(bug_type=k, description=k, applicability="always") for k in MUTANTS]
            return BugCategories(bug_categories=cats), {}
        if "MUTANT VERILOG BEGIN" in text:
            bug = text.split("BUG TYPE: ")[1].split("\n")[0]
            return f"MUTANT VERILOG BEGIN\n{MUTANTS[bug]}\nMUTANT VERILOG END", {}
        if "QUESTION BEGIN" in text:
            return f"QUESTION BEGIN\n{QUESTION}\nQUESTION END", {}
        # Otherwise: an answer request from the validator.
        self.answer_prompts.append(text)
        self.answer_calls += 1
        k = self.answer_calls % 5
        if k in (1, 2):
            return f"```verilog\n{WRAP13_REWRITE}\n```", {}  # correct, different structure
        if k == 3:
            return f"```verilog\n{ORIGINAL}\n```", {}        # plausible but wrong
        return "```verilog\nmodule nope(\n```", {}           # garbage


async def main():
    with tempfile.TemporaryDirectory() as tmp:
        cfg = Path(tmp) / "config.yaml"
        cfg.write_text(
            "batch_dir_path: ./yosys_files/smoke/\n"
            f"bug_categories_n: 4\nmutants_n: 4\nquestions_n: 1\n"
            "question_validation_n: 5\nmax_concurrent_yosys: 4\nequiv_max_steps: 60\n"
            "equiv_timeout_s: 120\nequiv_accept_bounded: true\nyosys_bin: yosys\n"
            f"debug_enabled: false\ndebug_log_file: {tmp}/log.txt\n"
        )
        config = Config(str(cfg))
        client = FakeClient()
        result = await process_single_design(ORIGINAL, client, config, "deepseek")

    assert "error" not in result, result
    print("\nkept mutants:", [m["bug_type"] for m in result["mutants"]])
    print("rejections:")
    for r in result["mutant_rejections"]:
        print(f"  {r['bug_type']:26s} {r['reason'][:70]}")
    q = result["questions"][0]
    print("question row:", json.dumps({k: q[k] for k in
          ("bug_type", "question_valid", "solve_rate", "proof_strength", "answer_statuses")}))

    leaked = any("q == 4'd13" in p or "always @" in p for p in client.answer_prompts)
    print("answer prompts containing target code:", leaked)

    kept = [m["bug_type"] for m in result["mutants"]]
    wraps = {"wrap at 13", "wrap at 13 (rewritten)"}
    assert len(kept) == 1 and kept[0] in wraps, kept
    reasons = {r["bug_type"]: r["reason"] for r in result["mutant_rejections"]}
    assert reasons["no-op change"].startswith("not_distinct_from_original")
    assert reasons[(wraps - {kept[0]}).pop()].startswith("duplicate_of_kept_mutant")
    assert reasons["syntax slip"].startswith("does_not_elaborate")
    assert q["question_valid"] and abs(q["solve_rate"] - 0.4) < 1e-9, q
    assert not leaked
    print("\nALL CHECKS PASSED")


asyncio.run(main())
