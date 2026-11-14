#!/usr/bin/env python3
"""Tests for harness/rtltask.py. Run: python3 harness/test_rtltask.py"""
import copy
import json
import os
import shutil
import subprocess
import sys
import tempfile
import unittest
from pathlib import Path

HERE = Path(__file__).resolve().parent
sys.path.insert(0, str(HERE))
import rtltask  # noqa: E402

EXAMPLES = HERE / "examples"
CLI = [sys.executable, str(HERE / "rtltask.py")]

WRONG = {
    "examples/alu8/repair": None,  # the unchanged buggy starter
    "examples/counter4/spec_to_rtl": {"rtl/top_module.v": """module top_module(input clk, input rst_n, input en,
    input load, input [3:0] d, output reg [3:0] q, output wrap);
  // bug: load ignored while en is high
  always @(posedge clk or negedge rst_n) begin
    if (!rst_n) q <= 4'd0;
    else if (en) q <= q + 4'd1;
    else if (load) q <= d;
  end
  assign wrap = en & ~load & (q == 4'hf);
endmodule
"""},
    "examples/rca4/infill": {"rtl/rca4.v": """module rca4(input [3:0] a, input [3:0] b, input cin, output [3:0] s, output cout);
  wire [4:0] c;
  assign c[0] = cin;
  genvar i;
  generate for (i = 0; i < 4; i = i + 1) begin : g
    full_adder fa(.a(a[i]), .b(b[i]), .cin(c[0]), .s(s[i]), .cout(c[i+1]));
  end endgenerate
  assign cout = c[4];
endmodule
"""},
}


def cli(*args):
    p = subprocess.run(CLI + list(args), stdout=subprocess.PIPE, stderr=subprocess.PIPE, text=True)
    return p.returncode, p.stdout, p.stderr


class RtlTaskTests(unittest.TestCase):
    @classmethod
    def setUpClass(cls):
        cls.tmp = Path(tempfile.mkdtemp(prefix="rtltask_test_"))
        cls.tasks = {}
        for src in sorted(EXAMPLES.glob("*.json")):
            dst = cls.tmp / src.name
            shutil.copy(src, dst)
            rc, out, err = cli("finalize", str(dst), "--write")
            assert rc == 0, "finalize failed for %s: %s %s" % (src.name, out, err)
            cls.tasks[src.stem] = dst

    @classmethod
    def tearDownClass(cls):
        shutil.rmtree(cls.tmp, ignore_errors=True)

    def _prepare(self, path, name):
        ws = self.tmp / ("ws_" + name)
        if ws.exists():
            shutil.rmtree(ws)
        rc, out, err = cli("prepare", str(path), str(ws))
        self.assertEqual(rc, 0, err)
        return ws

    def _grade(self, path, ws):
        rc, out, err = cli("grade", str(path), str(ws))
        self.assertEqual(rc, 0, err)
        return json.loads(out)

    def test_finalize_filled_task(self):
        for name, path in self.tasks.items():
            t = rtltask.load_task(path)
            with self.subTest(task=name):
                self.assertEqual(t["public_tests"]["cycles"], 64)
                self.assertEqual(len(t["public_tests"]["stimulus"]), 64)
                self.assertEqual(len(t["public_tests"]["expected"]), 64)
                self.assertIn("interface", t)
        t = rtltask.load_task(self.tasks["counter4_spec_to_rtl"])
        self.assertEqual(t["interface"]["clock"], "clk")
        self.assertEqual(t["interface"]["reset"], {"name": "rst_n", "active_low": True})
        stim = t["public_tests"]["stimulus"]
        # rst_n is the MSB of the 7-bit input word: held low (asserted) for the first 2 cycles
        self.assertTrue(all(int(w, 16) >> 6 == 0 for w in stim[:2]))
        self.assertIsNone(rtltask.load_task(self.tasks["alu8_repair"])["interface"]["clock"])

    def test_validate(self):
        for name, path in self.tasks.items():
            with self.subTest(task=name):
                rc, out, _ = cli("validate", str(path))
                rep = json.loads(out)
                self.assertTrue(rep["valid"], rep)

    def test_workspace_has_no_hidden_data(self):
        for name, path in self.tasks.items():
            t = rtltask.load_task(path)
            ws = self._prepare(path, name)
            with self.subTest(task=name):
                for rel in ("TASK.md", "tests/public/tb.v", "tests/public/stimulus.hex",
                            "tests/public/expected.hex", "tests/public/run.sh"):
                    self.assertTrue((ws / rel).is_file(), rel)
                blob = "\n".join(p.read_text(errors="replace") for p in ws.rglob("*") if p.is_file())
                for rel, text in t["hidden"]["reference_files"].items():
                    if text == (t.get("files") or {}).get(rel):
                        continue
                    self.assertNotIn(text.strip(), blob, "reference text leaked: %s" % rel)
                    # also no distinctive reference line that is absent from the starter
                    starter = "\n".join((t.get("files") or {}).values())
                    for line in text.splitlines():
                        s = line.strip()
                        if len(s) > 25 and s not in starter:
                            self.assertNotIn(s, blob, "reference line leaked: %r" % s)
                self.assertNotIn(str(t["hidden"]["hidden_vectors"]["seed"]) + "\n", (ws / "TASK.md").read_text())
                self.assertNotIn("hidden_vectors", blob)

    def test_public_run_sh(self):
        path = self.tasks["counter4_spec_to_rtl"]
        t = rtltask.load_task(path)
        ws = self._prepare(path, "runsh")
        rtltask.write_tree(ws, t["hidden"]["reference_files"])
        p = subprocess.run(["sh", str(ws / "tests/public/run.sh")], stdout=subprocess.PIPE, text=True)
        self.assertEqual(p.returncode, 0, p.stdout)
        self.assertIn("PASS", p.stdout)

    def test_grade_reference_is_correct(self):
        for name, path in self.tasks.items():
            t = rtltask.load_task(path)
            ws = self._prepare(path, "ref_" + name)
            rtltask.write_tree(ws, t["hidden"]["reference_files"])
            with self.subTest(task=name):
                g = self._grade(path, ws)
                self.assertTrue(g["compiled"], g)
                self.assertEqual(g["public"]["passed"], g["public"]["total"], g)
                self.assertEqual(g["hidden_vectors"]["passed"], g["hidden_vectors"]["total"], g)
                self.assertIn(g["formal"], ("equivalent", "bounded"), g)
                self.assertTrue(g["correct"], g)
                self.assertEqual(g["reward"], 1.0)
                self.assertIsInstance(g["synth"]["cells"], int)

    def test_grade_wrong_solution(self):
        for name, path in self.tasks.items():
            t = rtltask.load_task(path)
            ws = self._prepare(path, "wrong_" + name)
            wrong = WRONG[t["task_id"]]
            if wrong:
                rtltask.write_tree(ws, wrong)
            with self.subTest(task=name):
                g = self._grade(path, ws)
                self.assertFalse(g["correct"], g)
                self.assertEqual(g["reward"], 0.0)

    def test_infill_starter_and_readonly_restore(self):
        path = self.tasks["rca4_infill"]
        t = rtltask.load_task(path)
        ws = self._prepare(path, "ro")
        g = self._grade(path, ws)  # [MASKED] starter does not compile
        self.assertFalse(g["compiled"])
        self.assertEqual(g["reward"], 0.0)
        # correct editable file, but the agent sabotaged the read-only lib: must be ignored
        rtltask.write_tree(ws, t["hidden"]["reference_files"])
        (ws / "rtl/lib.v").write_text("module full_adder(input a, input b, input cin, output s, output cout);\n"
                                      "  assign s = 0; assign cout = 0;\nendmodule\n")
        (ws / "rtl/extra_not_editable.v").write_text("module junk(; endmodule\n")
        g = self._grade(path, ws)
        self.assertTrue(g["correct"], g)

    def test_formal_catches_vector_escape(self):
        """A bug the vectors are unlikely to hit must still be caught by formal."""
        path = self.tasks["alu8_repair"]
        t = rtltask.load_task(path)
        ref = t["hidden"]["reference_files"]["rtl/alu8.v"]
        sneaky = ref.replace("2'd2: y = a & b;", "2'd2: y = (a == 8'h5a && b == 8'ha5) ? 8'hff : (a & b);")
        status, _ = rtltask.formal_check(t, {"rtl/alu8.v": sneaky})
        self.assertEqual(status, "different")

    def test_validate_rejects_trivial_repair(self):
        t = rtltask.load_task(self.tasks["alu8_repair"])
        t["files"] = copy.deepcopy(t["hidden"]["reference_files"])
        rep = rtltask.cmd_validate(t)
        self.assertFalse(rep["valid"])
        self.assertTrue(any("starter" in r for r in rep["reasons"]), rep)

    def test_zero_input_design_and_x_outputs(self):
        ref = """module blink(input clk, output reg [3:0] cnt, output [7:0] junk);
  initial cnt = 4'd0;
  always @(posedge clk) cnt <= cnt + 4'd1;
  assign junk = (cnt == 4'd3) ? 8'hxx : {4'h0, cnt};
endmodule
"""
        t = {"schema_version": 1, "task_id": "test/blink/spec_to_rtl", "suite": "test", "kind": "spec_to_rtl",
             "spec": "free running counter", "top_module": "blink", "files": {}, "editable": ["rtl/blink.v"],
             "public_tests": None,
             "hidden": {"reference_files": {"rtl/blink.v": ref}, "reference_top": "blink"}}
        new, rep = rtltask.cmd_finalize(t)
        self.assertEqual(new["interface"]["inputs"], [])
        self.assertEqual(new["interface"]["clock"], "clk")
        self.assertTrue(all(w == "0" for w in new["public_tests"]["stimulus"]))
        self.assertTrue(any("x" in w for w in new["public_tests"]["expected"]))
        self.assertTrue(rep["valid"], rep)
        g = rtltask.grade_tree(new, {"rtl/blink.v": ref.replace("8'hxx", "8'h77")})
        self.assertTrue(g["correct"], g)

    def test_finalize_all(self):
        d = self.tmp / "all"
        d.mkdir(exist_ok=True)
        for src in EXAMPLES.glob("*.json"):
            shutil.copy(src, d / src.name)
        rc, out, err = cli("finalize-all", str(d), "--jobs", "3")
        summary = json.loads(out)
        self.assertEqual(rc, 0, out)
        self.assertEqual(summary["total"], 3)
        self.assertEqual(summary["valid"], 3)
        self.assertEqual(summary["by_kind"]["repair"]["total"], 1)
        self.assertEqual(summary["invalid_tasks"], [])


if __name__ == "__main__":
    unittest.main(verbosity=2)
