# Needs Assessment — What Hermes Needs

> Generated: 2026-06-02 | Hermes v0.13.0 | Ubuntu 24.04 LTS
> Last reviewed: 2026-06-22 17:00 UTC (daily cron)

## 🔴 Critical Gaps

### 1. Hermes Update Backlog

**Status:** 🟡 Improved but still behind. Hermes is now `v0.17.0 (2026.6.19)` and reports **175 commits behind**, down from **842 commits behind** in the 2026-06-21 daily audit / 2026-06-22 13:00 nightly snapshot.

**Why it matters:** The update reduced a large amount of drift, but a maintenance window is still needed to finish catching up. Do not run `hermes update` from cron because approval mode denies interactive maintenance work.

## 🟡 Important Gaps

### 2. Display / Background Noise Setting Still Open

**Status:** ⚠️ Founder approved reducing noise for `display.tool_progress` and `display.background_process_notifications`, but the prior session hit Hermes' safety guard when trying to edit `~/.hermes/config.yaml` directly. Current config still shows:
- `display.tool_progress: all`
- `display.background_process_notifications: all`

**Need:** Apply with the supported config path during an interactive/admin-safe window:
- `hermes config set display.tool_progress off`
- `hermes config set display.background_process_notifications error`

### 3. Metric Consistency: Sessions / Skills

**Status:** ⚠️ Nightly snapshot reports 264 sessions and 101 skills. Current direct checks show default `state.db` has **189 sessions / 6,810 messages** and `/root/.hermes/skills` has **109 `SKILL.md` files**.

**Need:** Confirm whether nightly snapshot counts all profiles / historical stores while direct checks count only the active default profile. Until then, session/skill trend numbers are not apples-to-apples.

### 4. STT Verification

**Status:** ⚠️ Config still shows local STT enabled (`provider: local`, `model: base`) and ffmpeg is present, but end-to-end voice note → transcript → agent delivery remains unverified.

### 5. Session Retention / Pruning

**Status:** ⚠️ `sessions.auto_prune: false`; retention_days is configured but pruning is not automatic. Direct default DB count is now 189 sessions.

### 6. Open Repo State Outside Hermes Research

**Status:** ⚠️ Two non-`hermes-research` repos have uncommitted work:
- `/root/hermes-workspace`: operations direct chat/profile files and generated route tree changes.
- `/root/honcho`: `uv.lock`, bootstrap scripts, service files, and test files.

**Need:** Review and either commit, stash, or remove stale test/bootstrap files.

### 7. Notion Task Visibility

**Status:** ⚠️ Notion API token works, but search found no pages updated today and no obvious active/open task database exposed to the integration.

**Need:** Share the real active tasks database with the Notion integration if daily reports should track Notion tasks reliably.

## 🟢 Improvements / Healthy Areas

### 8. Hermes Upgrade / Config Improvements

**Status:** ✅ Major improvement since the last daily audit.
- Hermes: `v0.17.0 (2026.6.19)`
- Backlog: 842 → 175 commits behind
- Config now shows safer long-session settings already applied:
  - `checkpoints.enabled: true`
  - `tool_output.max_bytes: 100000`
  - `tool_output.max_lines: 5000`
  - `tool_output.max_line_length: 8000`
  - `compression.threshold: 0.75`

### 9. Core Hermes Services

**Status:** ✅ `hermes-gateway` is active. No failed systemd units are currently reported.

Local ports are listening as expected:
- Gateway: `127.0.0.1:8642`
- Dashboard: `127.0.0.1:9119`
- Workspace: `127.0.0.1:4000`
- Wiki: `0.0.0.0:9090`
- Docker proxy owns public `80/443`

### 10. System Resources

**Status:** ✅ Disk and memory are healthy.
- Disk: 23G used / 49G total (50%)
- RAM: 3.1Gi used / 11Gi total, 8.6Gi available
- Swap: 518Mi used / 8.0Gi total
- Load: 1.18 / 1.08 / 1.27
- Uptime: 30 days, 15 hours

## Summary of Current State

```text
Hermes: v0.17.0 (2026.6.19)
Provider: openai-codex / gpt-5.5 in default config
Update backlog: 🟡 175 commits behind (improved from 842)
STT: ⚠️ configured, end-to-end smoke test still pending
TTS: ✅ Edge TTS configured
Memory: ✅ Honcho provider configured
Skills: ⚠️ 109 direct SKILL.md files vs 101 nightly snapshot count
Sessions: ⚠️ 189 direct default DB sessions vs 264 nightly snapshot count
Messages: 6,810 in default state.db
Cron: ✅ daily briefing / wiki jobs present
Gateway: ✅ active
Systemd failed units: ✅ none
Disk: ✅ 50% used
RAM: ✅ 8.6Gi available
Load: ✅ 1.18 / 1.08 / 1.27
Uptime: ✅ 30d 15h
Notion: ⚠️ API works; no current active task DB visible
```

## Action Items

1. **HIGH** — Finish Hermes update maintenance window; backlog is improved but still 175 commits behind.
2. Apply the Founder-approved low-noise display settings with `hermes config set` during an interactive/admin-safe window.
3. Review `/root/hermes-workspace` uncommitted operations-direct work and decide whether to commit or clean it.
4. Review `/root/honcho` uncommitted bootstrap/service/test files and decide whether to commit, stash, or remove them.
5. Normalize session/skill counting in nightly snapshot vs direct audit so trends are reliable.
6. Enable session pruning or create a weekly prune job after confirming retention policy.
7. Run STT smoke test: Telegram voice note → local transcription → agent receives transcript.
8. Share the active Notion tasks database with the integration if daily reports should include Notion task status.
