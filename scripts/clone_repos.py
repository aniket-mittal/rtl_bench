#!/usr/bin/env python3
"""Clone (or mirror) the 9 upstream repositories Task 3 needs.

Task 3 (repository-issue fixing) evaluates an LLM patch against the golden
patch from a real GitHub PR. The buggy RTL lives at `case["base_commit"]`
and the golden fix at `case["head_commit"]`, so we need full git history
checked out locally before evaluation runs.

Usage:
    # Plain clone over HTTPS (default)
    python3 scripts/clone_repos.py

    # Mirror from a local upstream cache (faster, no network)
    python3 scripts/clone_repos.py --from-mirror /path/to/repo_cache

    # Re-clone everything, removing existing caches first
    python3 scripts/clone_repos.py --force

Output: repo_cache/<owner>_<repo>/ for each unique repository in
data/repo_issue_108_cases.json. The directory is gitignored.
"""
from __future__ import annotations
import argparse
import json
import shutil
import subprocess
import sys
from pathlib import Path

REPO_ROOT = Path(__file__).resolve().parent.parent
DATA = REPO_ROOT / "data" / "repo_issue_108_cases.json"
CACHE = REPO_ROOT / "repo_cache"


def unique_repos() -> list[str]:
    data = json.loads(DATA.read_text())
    cases = data.get("cases", data if isinstance(data, list) else [])
    return sorted({c["repository"] for c in cases})


def slug(repo: str) -> str:
    return repo.replace("/", "_")


def required_commits(repo: str) -> tuple[set[str], set[str]]:
    """(base_commits, head_commits) referenced by 108-case dataset for one repo."""
    data = json.loads(DATA.read_text())
    cases = data.get("cases", data if isinstance(data, list) else [])
    bases, heads = set(), set()
    for c in cases:
        if c["repository"] != repo:
            continue
        if c.get("base_commit"):
            bases.add(c["base_commit"])
        if c.get("head_commit"):
            heads.add(c["head_commit"])
    return bases, heads


def clone_via_https(repo: str, dest: Path) -> bool:
    url = f"https://github.com/{repo}.git"
    print(f"  git clone {url} -> {dest}")
    return subprocess.run(["git", "clone", url, str(dest)]).returncode == 0


def mirror_local(repo: str, dest: Path, mirror_root: Path) -> bool:
    src = mirror_root / slug(repo)
    if not src.is_dir():
        src_alt = mirror_root / repo.replace("/", "_")
        if src_alt.is_dir():
            src = src_alt
        else:
            print(f"  not in mirror: {src}")
            return False
    print(f"  mirroring {src} -> {dest}")
    # `git clone --local` hardlinks where possible. After cloning, point origin
    # at the canonical GitHub URL so a subsequent PR-ref fetch can pull PR commits.
    res = subprocess.run(["git", "clone", "--local", str(src), str(dest)])
    if res.returncode != 0:
        return False
    subprocess.run(
        ["git", "-C", str(dest), "remote", "set-url", "origin",
         f"https://github.com/{repo}.git"],
        capture_output=True,
    )
    return True


def verify_commit(dest: Path, commit: str) -> bool:
    """Check that the named commit is reachable in the clone."""
    res = subprocess.run(
        ["git", "-C", str(dest), "cat-file", "-e", commit],
        capture_output=True,
    )
    return res.returncode == 0


def fetch_pr_refs(dest: Path) -> bool:
    """Fetch all PR refs from origin so PR base/head commits are reachable.

    GitHub exposes per-PR refs under `refs/pull/<num>/head`; default clones
    don't pull these. After this call, any commit referenced by an open or
    merged PR will be in the local repo.
    """
    print(f"  fetching PR refs (refs/pull/*) in {dest.name} ...")
    res = subprocess.run(
        ["git", "-C", str(dest), "fetch", "--quiet", "origin",
         "+refs/pull/*:refs/remotes/origin/pr/*"],
        capture_output=True, text=True,
    )
    if res.returncode != 0:
        print(f"    fetch failed: {res.stderr.strip()}")
        return False
    return True


def main() -> int:
    ap = argparse.ArgumentParser()
    ap.add_argument("--from-mirror", type=Path, default=None,
                    help="Clone from this local upstream cache instead of HTTPS.")
    ap.add_argument("--force", action="store_true", help="Remove existing clones first.")
    args = ap.parse_args()

    repos = unique_repos()
    print(f"Need {len(repos)} repos for Task 3:")
    for r in repos:
        print(f"  {r}")
    print()

    CACHE.mkdir(exist_ok=True)
    n_ok = n_skip = n_fail = 0
    for repo in repos:
        dest = CACHE / slug(repo)
        if dest.exists():
            if args.force:
                shutil.rmtree(dest)
            else:
                print(f"[skip] {repo} already at {dest}")
                n_skip += 1
                continue

        if args.from_mirror:
            ok = mirror_local(repo, dest, args.from_mirror)
            if not ok and args.from_mirror:
                # Fall back to HTTPS if mirror missed.
                print(f"  falling back to HTTPS for {repo}")
                ok = clone_via_https(repo, dest)
        else:
            ok = clone_via_https(repo, dest)

        if not ok:
            print(f"[fail] {repo}")
            n_fail += 1
            continue

        # PR commits aren't part of the default refspec; fetch them explicitly.
        bases, heads = required_commits(repo)
        missing = [c for c in (bases | heads) if not verify_commit(dest, c)]
        if missing:
            fetch_pr_refs(dest)
            missing = [c for c in (bases | heads) if not verify_commit(dest, c)]

        if missing:
            print(f"  ! {len(missing)} commit(s) still unreachable after PR-ref fetch:")
            for c in missing[:3]:
                print(f"    {c}")
            n_fail += 1
        else:
            n_ok += 1

    print(f"\nDone. ok={n_ok}  skipped={n_skip}  failed={n_fail}")
    return 0 if n_fail == 0 else 1


if __name__ == "__main__":
    sys.exit(main())
