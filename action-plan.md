# Action Plan

Priority-ordered roadmap. Each item has exact commands.

## This Session

### 1. ✅ Connect GitHub
- [x] Save PAT to .env and .git-credentials
- [x] Configure git identity (marketingaipros / dwhite4388@gmail.com)
- [x] Clone marketingaipros/hermes
- [x] Write initial research
- [ ] Push initial commit
- [ ] Set up nightly cron

### 2. ✅ STT (Speech-to-Text) — Already working

```bash
# Install faster-whisper + dependencies
pip install faster-whisper

# Enable in config
hermes config set stt.enabled true
hermes config set stt.provider local
hermes config set stt.local.model small

# Alternative: Groq (free tier, no install needed)
# Set GROQ_API_KEY in ~/.hermes/.env
# hermes config set stt.provider groq
```

**Decision:** faster-whisper `small` model (~466MB) is the best balance of quality and CPU speed. On an 11GB RAM system, it'll fit easily and run acceptably fast.

### 3. ✅ tmux Installed — remaining tools below

```bash
apt-get update
apt-get install -y tmux jq htop neovim
```

### 4. ✅ Hermes Updated

```bash
hermes update
```

### 5. 🟡 Verify OpenRouter Key

```bash
# Make sure the key is actually set (not just commented out)
grep -v '^#' ~/.hermes/.env | grep OPENROUTER_API_KEY
```

If empty/unset and you have a key:
```bash
echo 'OPENROUTER_API_KEY=sk-or-v1-...' >> ~/.hermes/.env
```

## Soon (This Week)

### 6. 🟡 Set Up Additional Cron Jobs

```bash
# Daily health check
hermes cron create "0 8 * * *" --prompt "Check system health: disk usage, memory, running processes. Alert if disk >80% or memory pressure."

# Weekly skill maintenance
hermes cron create "0 3 * * 0" --prompt "Run hermes curator status and report on stale/archived skills."
```

### 7. 🟡 Configure TTS Voice

Edge TTS is the default (free, no key needed). To customize:
```bash
hermes config set tts.provider edge
# Test: hermes chat -q "say hello world" with /voice tts
```

### 8. 🟡 Gateway Setup (if needed)

If you want Hermes accessible via Telegram/Discord/etc:
```bash
hermes gateway setup
```

## Later (When Needed)

### 9. Multi-Agent Workflows

Once tmux is installed:
```bash
# Spawn a parallel agent
tmux new-session -d -s worker -x 120 -y 40 'hermes -w'
```

### 10. Skill Development

As we discover workflows worth reusing, save them:
```bash
hermes skills create my-workflow
```

### 11. Security Hardening

```bash
hermes config set security.redact_secrets true
# Consider moving PAT out of .git-credentials to .env only
```