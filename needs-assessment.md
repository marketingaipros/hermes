# Needs Assessment — What Hermes Needs

> Generated: 2026-05-13 | Hermes v0.13.0 | Ubuntu 24.04 LTS

## 🔴 Critical Gaps

### 1. Voice Input (STT / Speech-to-Text)

**Status:** Completely absent. No whisper, no faster-whisper, no API key configured.

The user explicitly wants STT set up for voice messages. Without it, voice notes sent via any messaging platform go untranscribed.

**Options (in order of recommendation):**

| Option | Cost | Setup Effort | Quality |
|--------|------|-------------|---------|
| **faster-whisper (local)** | Free | Medium (pip install + model download) | Very good |
| Groq Whisper API | Free tier | Low (API key only) | Excellent |
| OpenAI Whisper API | Paid | Low (API key only) | Excellent |

**Recommended:** Start with faster-whisper (local, free, no API dependency), fall back to Groq if local inference is too slow.

**Exact commands:**
```bash
pip install faster-whisper
# Models: tiny (75MB), base (145MB), small (466MB), medium (1.5GB), large-v3 (3GB)
# Recommend: small or medium for quality/speed balance
```

**Config needed in config.yaml:**
```yaml
stt:
  enabled: true
  provider: local
  local:
    model: small
```

### 2. Hermes Update Available

**Status:** 1 commit behind main. Running v0.13.0 (2026.5.7).

```bash
hermes update
```

Bug fixes and new features accumulate fast. Staying current prevents hitting already-fixed bugs.

## 🟡 Important Gaps

### 3. tmux Not Installed

**Status:** Missing. Needed for spawning parallel Hermes instances (multi-agent workflows, long-running background agents).

```bash
apt-get install -y tmux
```

Without tmux, we can't:
- Run multiple Hermes instances side-by-side
- Have an agent work on a task while we chat separately
- Spawn interactive Hermes sessions programmatically

### 4. OpenRouter API Key in .env

**Status:** The .env file has the key commented out. Need to verify it's actually set as the `OPENROUTER_API_KEY` env var. If the key is only in the credential pool and not in .env, auxiliary models (vision, compression, session search) may fail.

**Check:** `grep OPENROUTER_API_KEY ~/.hermes/.env`

### 5. ML/GPU Capabilities

**Status:** No CUDA, no GPU visible. 11GB RAM, CPU-only.

This affects:
- Local STT speed (faster-whisper on CPU is usable but slower)
- Any local model inference
- Image generation (ComfyUI skill needs GPU for practical use)

**Recommendation:** Accept CPU-only for now. Use `small` or `base` whisper model to keep STT responsive. Offload heavy ML to APIs (Groq, OpenAI, Replicate).

## 🟢 Nice-to-Have

### 6. Additional Tools

| Tool | Why | Command |
|------|-----|---------|
| `jq` | JSON processing in shell | `apt-get install -y jq` |
| `htop` | System monitoring | `apt-get install -y htop` |
| `gh` CLI | Better GitHub interaction | Complex (needs Node.js) — skip for now |
| `ripgrep` | Already have via search_files tool | Not needed |
| `neovim`/`vim` | File editing in terminal | `apt-get install -y neovim` |

### 7. Cron Jobs to Consider

| Job | Schedule | Purpose |
|-----|----------|---------|
| **Hermes update check** | Daily | `hermes update` if new version |
| **System health** | Hourly | Disk >80%, memory pressure, process count |
| **GitHub sync** | Nightly | Push Hermes state snapshots (this repo) |
| **Skill curator** | Weekly | Auto-archive stale skills |

### 8. Security Hardening

| Item | Recommendation |
|------|---------------|
| Token storage | Move PAT from .git-credentials to .env only (less exposed) |
| YOLO mode | Keep off — `approvals.mode: manual` |
| Secret redaction | Consider enabling `security.redact_secrets: true` |
| Gateway | Not set up yet — decide if needed |

## Summary of State at Last Audit

```
Hermes v0.13.0 (1 commit behind)
Provider: OpenRouter → deepseek/deepseek-v4-pro
STT: ❌ Nothing installed
TTS: ✅ Edge TTS (default, free, works)
Memory: ✅ Enabled
Skills: 100+ bundled skills installed
GitHub: ✅ Connected (git + HTTPS token)
Cron: ❌ No jobs configured
Gateway: ❌ Not configured
Multi-agent: ❌ No tmux
Disk: 39GB free of 49GB
RAM: 11GB total, 9.8GB free
```
