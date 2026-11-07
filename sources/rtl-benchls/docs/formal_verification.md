# Formal verification with commercial EDA tools

RTL-BenchLS uses formal equivalence checking to judge whether an LLM's
generated RTL is functionally equivalent to the golden reference:

- **LEC** (Logic Equivalence Checking) — combinational designs.
  Tools: Cadence Conformal, Synopsys Formality.
- **SEC** (Sequential Equivalence Checking) — sequential designs with clocks.
  Tools: Cadence JasperGold.

Each dataset record carries the tool-specific script that was used in the
paper experiments (key names `conformal_rtl_<top>.do`, `fm_rtl_<top>.tcl`,
or `sec_<top>.tcl`). The `Verifier` callable the framework expects receives
those scripts under `extra_files`.

This document describes how to wire up the three common deployment modes:
**local install**, **remote SSH server**, and **Docker container**.


## 1. The interface the framework expects

```python
from typing import Literal, Mapping

def my_verify(
    golden_rtl: str,
    revised_rtl: str,
    top_module: str,
    *,
    design_type: Literal["combinational", "sequential"],
    extra_files: Mapping[str, str] = {},
) -> bool:
    """Return True iff the two RTL texts are proven equivalent."""
```

For each call, `extra_files` contains the embedded script (e.g.
`extra_files["conformal_rtl_<top>.do"]`) plus any auxiliary files
(`lib.v`, `sources.json`). Your implementation:

1. Writes `golden_rtl`, `revised_rtl`, and the relevant script to a work dir.
2. Invokes the EDA tool with the script.
3. Parses the tool's log for the pass criterion.
4. Returns `True` / `False`.

Reference template: [`rtlbenchls/verify_reference.py`](../rtlbenchls/verify_reference.py).


## 2. Concrete commands the framework relies on

These are the commands the paper experiments invoked. Adapt them to your
environment.

### Cadence Conformal LEC

```bash
$CONFORMAL_HOME/tools/bin/lec -nogui -dofile conformal_rtl.do < /dev/null \
    2>&1 | tee lec.log
```

Pass criterion (parsed from `lec.log`):
- contains `Equivalent`
- AND `0 non-equivalent` (or no `non-equivalent` line at all)

### Synopsys Formality (alternative LEC)

```bash
fm_shell -f fm_rtl.tcl 2>&1 | tee lec.log
```

Pass criterion: log contains `Verification SUCCEEDED` after `Verification Results`.

### Cadence JasperGold SEC

```bash
jaspergold -sec -batch -tcl sec_<top>.tcl 2>&1 | tee sec.log
```

Pass criterion: log contains a line with exactly `proven`.

When writing your own parser, anchor on the tool's *summary* line rather
than the progress stream (the latter can include phrases like
`0 Non-equivalent` mid-run that look like passes but are not the verdict).
The reference parser at
[`rtlbenchls/verify_reference.py`](../rtlbenchls/verify_reference.py) shows
the safe matching pattern for each tool.


## 3. Deployment modes

### Mode A: tools installed locally

If `lec` / `fm_shell` / `jaspergold` are on your `PATH`, the reference
`verify_reference.verify_reference` works out of the box:

```python
import os
os.environ["CONFORMAL_LEC"] = "/path/to/lec"             # if not on PATH
os.environ["JASPERGOLD_BIN"] = "/path/to/jaspergold"     # if not on PATH

from rtlbenchls.verify_reference import verify_reference as my_verify
```

### Mode B: tools on a remote server (SSH)

This is how the paper experiments were run (the EDA licenses live on a shared
compute server). The pattern:

1. Upload `golden.v`, `revised.v`, and the script to `$REMOTE_WORK/<job>/`.
2. Run the EDA command remotely.
3. Pull the log back and parse it.

#### Recommended: SSH key authentication (prefer this over passwords)

Key-based auth is more secure than password auth: keys can be revoked
without rotating shared secrets, they don't appear in process listings or
shell history, they work with `ssh-agent` for unattended runs, and they
compose with hardware tokens / MFA. **Use a dedicated key for this benchmark
so you can revoke it independently of your personal SSH key.**

```bash
# 1. Generate a dedicated key (no passphrase = unattended; add one for safety).
ssh-keygen -t ed25519 -f ~/.ssh/rtlbenchls_key -C "rtlbenchls@$(hostname)"

# 2. Deploy the public key to the EDA server.
ssh-copy-id -i ~/.ssh/rtlbenchls_key.pub your_user@eda-server.example.com

# 3. (Optional) Add a host alias to ~/.ssh/config so the verifier just says
#    "eda-server" — Paramiko/OpenSSH then handles user, port, key file, and
#    ProxyJump for you.
cat >> ~/.ssh/config <<'EOF'
Host eda-server
    HostName eda-server.example.com
    User your_user
    IdentityFile ~/.ssh/rtlbenchls_key
    IdentitiesOnly yes
EOF
chmod 600 ~/.ssh/config ~/.ssh/rtlbenchls_key

# 4. Smoke-test the connection.
ssh eda-server "echo connected as \$(whoami) on \$(hostname)"
```

#### Configuration

Copy [`config/ssh_config.yaml.example`](../config/ssh_config.yaml.example)
to `config/ssh_config.yaml` (gitignored) and fill it in. The verifier
**prefers `key_file` over `password`**; password is supported only as a
fallback for environments where keys aren't available.

```yaml
active_profile: default
profiles:
  default:
    host: eda-server.example.com
    user: your_user
    key_file: ~/.ssh/rtlbenchls_key   # preferred; comment out to fall back
    # password: ""                     # fallback only; set via $SSH_PASSWORD
    remote_work_dir: /scratch/your_user/rtlbenchls
```

#### A self-contained SSH verifier

This adapter uses [paramiko](https://pypi.org/project/paramiko/) and depends
on no upstream code. It loads the YAML config, picks key-file auth when
present, and falls back to password only if no key is configured.

```python
import os, tempfile, yaml, paramiko
from pathlib import Path

CONFIG = yaml.safe_load(Path("config/ssh_config.yaml").read_text())
P = CONFIG["profiles"][CONFIG["active_profile"]]
REMOTE_WORK = P["remote_work_dir"]


def _connect() -> paramiko.SSHClient:
    """Open an SSH session. Prefer key_file; fall back to $SSH_PASSWORD."""
    c = paramiko.SSHClient()
    c.load_system_host_keys()
    c.set_missing_host_key_policy(paramiko.AutoAddPolicy())
    key_file = P.get("key_file") or os.environ.get("SSH_KEY_FILE")
    if key_file:
        c.connect(P["host"], username=P["user"],
                  key_filename=os.path.expanduser(key_file),
                  look_for_keys=True, allow_agent=True, timeout=30)
    else:
        password = os.environ.get("SSH_PASSWORD") or P.get("password") or ""
        if not password:
            raise RuntimeError("No key_file and no password — set key_file in "
                               "ssh_config.yaml or export SSH_PASSWORD")
        c.connect(P["host"], username=P["user"], password=password, timeout=30)
    return c


def _put(sftp, local: str, remote: str) -> None:
    sftp.put(local, remote)


def _run(ssh, cmd: str, timeout: int = 600) -> tuple[int, str]:
    stdin, stdout, stderr = ssh.exec_command(cmd, timeout=timeout)
    out = stdout.read().decode() + stderr.read().decode()
    return stdout.channel.recv_exit_status(), out


def my_verify(golden_rtl, revised_rtl, top, *, design_type, extra_files={}):
    with tempfile.TemporaryDirectory() as td:
        # Materialize locally then upload.
        local = Path(td)
        (local / "golden.v").write_text(golden_rtl)
        (local / "revised.v").write_text(revised_rtl)
        script_key = next((k for k in extra_files
                           if k.startswith("conformal_rtl_")
                           or k.startswith("sec_")
                           or k.startswith("fm_rtl_")), None)
        if script_key:
            (local / script_key).write_text(extra_files[script_key])

        with _connect() as ssh:
            job = f"{REMOTE_WORK}/job_{os.getpid()}_{top}"
            sftp = ssh.open_sftp()
            _run(ssh, f"mkdir -p {job}")
            for name in ["golden.v", "revised.v"] + ([script_key] if script_key else []):
                _put(sftp, str(local / name), f"{job}/{name}")
            sftp.close()

            if design_type == "sequential":
                cmd = f"cd {job} && jaspergold -sec -batch -tcl {script_key} 2>&1 | tee sec.log"
                rc, log = _run(ssh, cmd)
                return any(line.strip() == "proven" for line in log.splitlines())
            else:
                cmd = (f"cd {job} && lec -nogui -dofile {script_key} "
                       "< /dev/null 2>&1 | tee lec.log")
                rc, log = _run(ssh, cmd)
                low = log.lower()
                return "equivalent" in low and (
                    "non-equivalent" not in low or "0 non-equivalent" in low)
```

#### Troubleshooting SSH auth

| Symptom | Likely cause | Fix |
|---|---|---|
| `Permission denied (publickey)` | key not on server, or wrong permissions | `ssh-copy-id` and `chmod 600 ~/.ssh/rtlbenchls_key` |
| `Permission denied (publickey,password)` | server rejected key, fell through to password | check server `~/.ssh/authorized_keys` and `sshd` `PubkeyAuthentication yes` |
| Paramiko `AuthenticationException` even with `look_for_keys=True` | passphrase-protected key without agent | `ssh-add ~/.ssh/rtlbenchls_key`, then re-run |
| Connection hangs at handshake | host blocks unknown IPs | check VPN, firewall, or use a `ProxyJump` in `~/.ssh/config` |

### Mode C: tools in a Docker container

If the EDA tools are packaged in an image (licenses still need to reach a
server), wrap the invocation in `docker run`:

```python
import subprocess, tempfile

def my_verify(golden_rtl, revised_rtl, top, *, design_type, extra_files):
    with tempfile.TemporaryDirectory() as td:
        # ... write golden.v, revised.v, conformal_rtl.do as in Mode A ...

        cmd = [
            "docker", "run", "--rm",
            "-v", f"{td}:/work",
            "-v", "/path/to/license:/license:ro",
            "-e", "CDS_LIC_FILE=/license/cadence.lic",
            "-w", "/work",
            "your-eda-image:latest",
            "lec", "-nogui", "-dofile", "conformal_rtl.do",
        ]
        proc = subprocess.run(cmd, capture_output=True, text=True, timeout=600)
        log = proc.stdout + proc.stderr
        return ("Equivalent" in log) and ("non-equivalent" not in log.lower()
                                           or "0 non-equivalent" in log.lower())
```

Common pitfalls:
- License server reachable from the container? Bind-mount `/etc/hosts` or
  use `--network host`.
- The container's user needs write access to `/work`. Use `--user $(id -u)`.
- For SEC runs JasperGold creates a `jgproject/` directory — use a writable
  mount, not a read-only one.


## 4. Sanity-checking your verifier

Before evaluating an LLM end-to-end, smoke-test your verifier with a known
equivalent pair (golden vs golden):

```python
from rtlbenchls import load_task1
rec = next(load_task1("data/slice_01.jsonl"))
assert my_verify(rec["rtl"], rec["rtl"], rec["top_module"],
                 design_type=rec["design_type"],
                 extra_files=rec["extra_files"]), \
    "verifier should accept golden ≡ golden"
```

If this fails, the issue is in your wiring, not the LLM.


## 5. Troubleshooting

| Symptom | Likely cause | Fix |
|---|---|---|
| "license server unreachable" | wrong `CDS_LIC_FILE` / port not open | check env, firewall, VPN |
| "fm_shell: command not found" | Formality not on PATH | source the vendor setup script |
| LEC hangs forever | dofile dropped to interactive prompt | pipe `< /dev/null` |
| SEC reports "proven" but log also has errors | spec/impl elaborated different tops | set `-top <name>` explicitly |
| Conformal "FMR_VLOG-079" abort | incomplete sensitivity list | add `set_mismatch_message_filter -warn FMR_VLOG-079` |
| All comparisons report not equivalent | tool reading the wrong file | print the work dir and inspect `golden.v` / `revised.v` |

A note on pass-criterion parsing: a naive substring search for
`0 Non-equivalent` can match progress lines mid-run and silently treat
failures as passes. Always anchor your parser on the tool's *summary* line
(or the explicit `proven` / `Verification SUCCEEDED` verdict), not on
intermediate output.
