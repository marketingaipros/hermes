# System Audit

> Captured: 2026-05-13 07:00 UTC

## Hardware

| Resource | Value |
|----------|-------|
| CPU | x86_64 (unknown cores) |
| RAM | 11 GB total, ~508 MB used |
| Disk | 49 GB (loop device), 8 GB used, 39 GB free |
| GPU | None visible |
| Hostname | app-coolify |
| Kernel | 6.8.12-22-pve (Proxmox VE) |

## OS

| Detail | Value |
|--------|-------|
| Distribution | Ubuntu 24.04.4 LTS (Noble Numbat) |
| Python (system) | 3.12.3 |
| Python (Hermes venv) | 3.11.15 |
| OpenAI SDK | 2.24.0 |

## Hermes Installation

| Detail | Value |
|--------|-------|
| Version | v0.13.0 (2026.5.7) |
| Project path | /usr/local/lib/hermes-agent |
| Config | ~/.hermes/config.yaml |
| Secrets | ~/.hermes/.env |
| Skills dir | ~/.hermes/skills/ (100+ bundled) |
| Sessions | ~/.hermes/sessions/ |

## Installed Tools

| Tool | Version | Notes |
|------|---------|-------|
| git | 2.43.0 | ✅ |
| curl | ✓ | ✅ |
| wget | ✓ | ✅ |
| python3 | 3.12.3 | ✅ |
| pip3 | ✓ | ✅ |
| ffmpeg | 7:6.1.1 | ✅ (needed for STT/TTS) |
| tmux | ✗ | ❌ NOT INSTALLED |
| vim/neovim | ✗ | ❌ NOT INSTALLED |
| jq | ✗ | ❌ NOT INSTALLED |
| gh CLI | ✗ | ❌ NOT INSTALLED |
| htop | ✗ | ❌ NOT INSTALLED |

## ML/AI Packages

| Package | Installed | Notes |
|---------|-----------|-------|
| faster-whisper | ❌ | Needed for local STT |
| openai-whisper | ❌ | Alternative STT |
| torch | ❌ | Needed by faster-whisper |
| transformers | ❌ | Needed by some ML skills |
| CUDA | ❌ | No GPU available |

## Config State

### Provider
- Default: deepseek/deepseek-v4-pro via OpenRouter
- Chat completions API mode

### Agent Settings
- Max turns: 90
- Tool use enforcement: auto
- Reasoning effort: medium
- 8 personalities configured

### Memory
- Memory store: built-in
- User profile: enabled

### Security
- Approvals: manual (default)
- Secret redaction: off (default)

## API Keys in .env

| Key | Status |
|-----|--------|
| OPENROUTER_API_KEY | Commented out |
| GOOGLE_API_KEY | Commented out |
| GITHUB_TOKEN | ✅ Set (PAT) |
| GROQ_API_KEY | ❌ Not present |
| ELEVENLABS_API_KEY | ❌ Not present |
