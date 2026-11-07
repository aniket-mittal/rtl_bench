"""End-to-end smoke tests for the rtlbenchls framework.

Run with:
    python -m pytest tests/
or simply:
    python tests/test_framework.py
"""
from __future__ import annotations
import json
import sys
import tempfile
from pathlib import Path

REPO = Path(__file__).resolve().parent.parent
sys.path.insert(0, str(REPO))

from rtlbenchls import (
    run_task1, run_task2, run_task3,
    load_task1, load_task2, load_task3,
    aggregate, verify_noop, make_fetchers,
)
from rtlbenchls.utils import extract_verilog, count_tokens, find_top_module


# ---------- utils ----------

def test_extract_verilog_fenced():
    text = "Here is your module:\n```verilog\nmodule foo; endmodule\n```"
    assert extract_verilog(text) == "module foo; endmodule"


def test_extract_verilog_unfenced():
    text = "module bar; endmodule"
    assert extract_verilog(text) == "module bar; endmodule"


def test_count_tokens_nonzero():
    assert count_tokens("module foo; endmodule") > 0


def test_find_top_module_with_hint():
    assert find_top_module("module foo; endmodule\nmodule bar; endmodule", "bar") == "bar"


def test_find_top_module_no_hint():
    assert find_top_module("module foo; endmodule", "") == "foo"


# ---------- dataset ----------

def test_task1_records_have_required_fields():
    recs = list(load_task1(REPO / "data/slice_01.jsonl"))
    assert len(recs) == 420
    for r in recs[:3]:
        assert r["task_id"] and r["design_name"] and r["top_module"]
        assert r["design_type"] in ("combinational", "sequential")
        assert r["verification_type"] in ("LEC", "SEC")
        assert r["rtl"]


def test_task2_records_have_masked_sentinel():
    recs = list(load_task2(REPO / "data/masked_designs.jsonl"))
    assert len(recs) == 425
    for r in recs:
        assert r["task_id"]
        assert r["mask_type"] in ("block", "module")
        assert "[MASKED]" in r["masked_rtl"], f"{r['task_id']} missing [MASKED] sentinel"
        assert r["golden_rtl"]


def test_task3_records_have_commits():
    recs = list(load_task3(REPO / "data/repo_issue_108_cases.json"))
    assert len(recs) == 108
    for r in recs[:3]:
        assert r["task_id"] and r["repository"]
        assert r["base_commit"] and r["head_commit"]
        assert r["verilog_files"]


# ---------- runner ----------

_STUB_OUTPUT = "```verilog\nmodule top; endmodule\n```"


def _stub_llm(prompt, *, system="", max_tokens=4096, temperature=0.0):
    return _STUB_OUTPUT


def test_run_task1_smoke_3_designs():
    with tempfile.TemporaryDirectory() as td:
        out = Path(td) / "t1.jsonl"
        results = run_task1(
            REPO / "data/slice_01.jsonl",
            llm=_stub_llm, verify=verify_noop,
            output_path=out, max_designs=3,
        )
        assert len(results) == 3
        for r in results:
            assert r["passed"] is True
            assert "error" not in r
        agg = aggregate(out, denominator=420)
        assert agg["n"] == 3 and agg["pass"] == 3


def test_run_task2_splices_mask():
    """Mask splice should put [MASKED] -> recovered_block; verifier sees a non-masked design."""
    with tempfile.TemporaryDirectory() as td:
        out = Path(td) / "t2.jsonl"
        seen_revised = []

        def capturing_verify(golden_rtl, revised_rtl, top_module, *, design_type, extra_files={}):
            seen_revised.append(revised_rtl)
            return True

        run_task2(REPO / "data/masked_designs.jsonl",
                  llm=_stub_llm, verify=capturing_verify,
                  output_path=out, max_designs=3)
        for r in seen_revised:
            assert "[MASKED]" not in r, "splice failed to substitute"


def test_verifier_exception_is_caught():
    """A bad verifier should not crash the run; the design counts as fail with error."""
    def bad_verify(*a, **kw):
        raise RuntimeError("boom")
    with tempfile.TemporaryDirectory() as td:
        out = Path(td) / "t1.jsonl"
        results = run_task1(REPO / "data/slice_01.jsonl",
                            llm=_stub_llm, verify=bad_verify,
                            output_path=out, max_designs=2)
        assert all(r["passed"] is False for r in results)
        assert all(r["error"].startswith("verifier:RuntimeError") for r in results)


# ---------- aggregate ----------

def test_aggregate_against_released():
    """Aggregate of a shipped per-model file matches the value in results_summary.json."""
    summary = json.loads((REPO / "results/results_summary.json").read_text())
    s_path = REPO / "results/task_1_round_trip/claude-sonnet-4.5.jsonl"
    if not s_path.exists():
        return  # released files not present
    agg = aggregate(s_path, denominator=420)
    expected_pct = summary["task_1_round_trip"]["models"]["claude-sonnet-4.5"]["pass_pct_collected_420base"]
    assert abs(agg["pass_pct"] - expected_pct) < 0.05


# ---------- fetch_repo ----------

def test_make_fetchers_returns_callables():
    fb, fg = make_fetchers(cache_dir=REPO / "repo_cache")
    assert callable(fb) and callable(fg)


def test_fetch_repo_buggy_rtl_if_cache_present():
    """If repo_cache/ is populated, fetching the first case's buggy RTL should work."""
    cache = REPO / "repo_cache"
    if not (cache / "YosysHQ_picorv32").is_dir():
        return  # skip: cache not populated
    fb, fg = make_fetchers(cache_dir=cache)
    case = next(load_task3(REPO / "data/repo_issue_108_cases.json"))
    buggy = fb(case)
    golden = fg(case)
    assert isinstance(buggy, str) and len(buggy) > 100
    assert isinstance(golden, str) and len(golden) > 100
    # Most cases produce different buggy vs golden (PR introduced changes)
    # but some patches are minimal — just check both decode.


# ---------- runner controls: limit / offset / resume / workers ----------

def test_limit_and_offset():
    with tempfile.TemporaryDirectory() as td:
        out = Path(td) / "t.jsonl"
        res = run_task1(REPO / "data/slice_01.jsonl", llm=_stub_llm, verify=verify_noop,
                        output_path=out, offset=2, limit=3)
        assert len(res) == 3
        # offset=2 means we skipped the first two task_ids
        all_ids = [r["task_id"] for r in load_task1(REPO / "data/slice_01.jsonl")]
        assert [r["task_id"] for r in res] == all_ids[2:5]


def test_resume_skips_completed():
    with tempfile.TemporaryDirectory() as td:
        out = Path(td) / "t.jsonl"
        run_task1(REPO / "data/slice_01.jsonl", llm=_stub_llm, verify=verify_noop,
                  output_path=out, limit=3)
        assert sum(1 for _ in out.open()) == 3
        # Resume up to limit=6: should add 3 more, no duplicates.
        run_task1(REPO / "data/slice_01.jsonl", llm=_stub_llm, verify=verify_noop,
                  output_path=out, limit=6, resume=True)
        ids = [json.loads(l)["task_id"] for l in out.open()]
        assert len(ids) == 6 and len(set(ids)) == 6


def test_force_truncates():
    with tempfile.TemporaryDirectory() as td:
        out = Path(td) / "t.jsonl"
        run_task1(REPO / "data/slice_01.jsonl", llm=_stub_llm, verify=verify_noop,
                  output_path=out, limit=5)
        run_task1(REPO / "data/slice_01.jsonl", llm=_stub_llm, verify=verify_noop,
                  output_path=out, limit=2, resume=True, force=True)
        assert sum(1 for _ in out.open()) == 2


def test_workers_produce_full_unique_set():
    with tempfile.TemporaryDirectory() as td:
        out = Path(td) / "t.jsonl"
        run_task1(REPO / "data/slice_01.jsonl", llm=_stub_llm, verify=verify_noop,
                  output_path=out, limit=8, max_workers=4)
        ids = [json.loads(l)["task_id"] for l in out.open()]
        assert len(ids) == 8 and len(set(ids)) == 8


def test_max_designs_backcompat_alias():
    with tempfile.TemporaryDirectory() as td:
        out = Path(td) / "t.jsonl"
        res = run_task1(REPO / "data/slice_01.jsonl", llm=_stub_llm, verify=verify_noop,
                        output_path=out, max_designs=4)
        assert len(res) == 4


# ---------- CLI ----------

def test_cli_dataset_resolution():
    from rtlbenchls.run import resolve_dataset, default_output
    assert resolve_dataset(1, None, None) == "data/slice_01.jsonl"
    assert resolve_dataset(1, None, 7) == "data/slice_07.jsonl"
    assert resolve_dataset(2, "custom.jsonl", None) == "custom.jsonl"
    assert default_output(1, "mymod:gpt4o").endswith("task_1_round_trip/gpt4o.jsonl")


def test_cli_verifier_resolution():
    from rtlbenchls.run import resolve_verifier
    assert resolve_verifier("noop") is verify_noop
    # reference is importable even if EDA tools are absent (it only fails at call time)
    assert callable(resolve_verifier("reference"))


def test_cli_end_to_end(tmp_path=None):
    import subprocess, os
    out = Path(tempfile.mkdtemp()) / "cli.jsonl"
    stub = Path(tempfile.mkdtemp()) / "stubmodel.py"
    stub.write_text(
        "def echo(prompt, *, system='', max_tokens=4096, temperature=0.0):\n"
        "    return '```verilog\\nmodule top; endmodule\\n```'\n"
    )
    env = dict(os.environ, PYTHONPATH=str(stub.parent) + os.pathsep + str(REPO))
    r = subprocess.run(
        [sys.executable, "-m", "rtlbenchls.run", "--task", "1",
         "--model", "stubmodel:echo", "--verifier", "noop",
         "--limit", "3", "--output", str(out)],
        cwd=REPO, env=env, capture_output=True, text=True,
    )
    assert r.returncode == 0, r.stderr
    assert sum(1 for _ in out.open()) == 3
    assert out.with_suffix(".summary.json").is_file()


# ---------- entry point ----------

if __name__ == "__main__":
    import inspect
    g = globals()
    names = [n for n in g if n.startswith("test_")]
    n_pass = n_fail = 0
    for n in names:
        try:
            g[n]()
            print(f"  PASS  {n}")
            n_pass += 1
        except Exception as e:
            print(f"  FAIL  {n}: {type(e).__name__}: {e}")
            n_fail += 1
    print(f"\n{n_pass} passed, {n_fail} failed (of {len(names)})")
    sys.exit(0 if n_fail == 0 else 1)
