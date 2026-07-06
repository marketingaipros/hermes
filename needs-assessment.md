# Needs Assessment — What Hermes Needs

> Generated: 2026-06-02 | Hermes v0.13.0 | Ubuntu 24.04 LTS
> Last reviewed: 2026-07-06 17:01 UTC (daily cron)

## 🔴 Critical Gaps

### 1. Hermes Update Backlog Regressed

**Status:** 🔴 Hermes is still `v0.17.0 (2026.6.19)` but now reports **2,282 commits behind**. The prior daily audit recorded **175 commits behind**; the 2026-07-06 nightly snapshot also reported 2,282 behind, so this is confirmed current drift rather than a one-off check.

**Why it matters:** The local install is materially behind upstream and may be missing fixes/features. Do not run `hermes update` from cron because approval mode denies interactive maintenance work; schedule an interactive maintenance window.

## 🟡 Important Gaps

### 2. Gateway Integrations Have Active Warnings

**Status:** ⚠️ `hermes-gateway` is running and `/health` returns 200, but recent service logs show:
- Discord login failure: `Improper token has been passed`.
- Wazuh MCP initial connection failed after 3 attempts.

**Need:** Validate Discord token/config only if Discord support is still desired. Route any Wazuh operational troubleshooting to the SentinelTech read-only analyst profile; do not mix protected SentinelTech data into general business reporting.

### 3. Dashboard / Workspace Availability Drift

**Status:** ⚠️ Expected local ports changed since the last audit:
- Gateway `127.0.0.1:8642`: ✅ healthy.
- Wiki `0.0.0.0:9090`: ✅ healthy.
- Dashboard `127.0.0.1:9119`: ❌ not listening during this audit.
- Workspace `127.0.0.1:4000`: listening, but HTTP check timed out after 5s.

**Need:** Restart/check dashboard and workspace when UI access is needed.

### 4. Display / Background Noise Setting Still Open

**Status:** ⚠️ Founder approved reducing noise for `display.tool_progress` and `display.background_process_notifications`, but current config still shows:
- `display.tool_progress: all`
- `display.background_process_notifications: all`

**Need:** Apply with the supported config path during an interactive/admin-safe window:
- `hermes config set display.tool_progress off`
- `hermes config set display.background_process_notifications error`

### 5. Metric Consistency: Sessions / Skills

**Status:** ⚠️ Count sources still disagree:
- Nightly snapshot: **274 sessions / 101 skills**.
- Direct default DB check: **203 sessions / 7,030 messages**.
- Direct local skills scan: **109 `SKILL.md` files**.
- Memory wiki generator: **222 sessions / 13,801 messages / 17 topics**.

**Need:** Confirm whether nightly snapshot counts all profiles, JSON sessions, or a different store while direct checks count only the active default profile. Until then, session/skill trend numbers are not apples-to-apples.

### 6. STT Verification

**Status:** ⚠️ Config still shows local STT enabled (`provider: local`, `model: base`) and ffmpeg is present, but end-to-end voice note → transcript → agent delivery remains unverified.

### 7. Session Retention / Pruning

**Status:** ⚠️ `sessions.auto_prune: false`; retention_days is configured but pruning is not automatic. Direct default DB count is now 203 sessions.

### 8. Open Repo State Outside Hermes Research

**Status:** ⚠️ Two non-`hermes-research` repos still have uncommitted work:
- `/root/hermes-workspace`: operations direct chat/profile files, generated route tree changes, backups, and tests.
- `/root/honcho`: `uv.lock`, bootstrap scripts, service files, compose backups, and tests.

**Need:** Review and either commit, stash, or remove stale test/bootstrap files.

### 9. Notion Task Visibility

**Status:** ⚠️ Notion API works. No pages were updated today. Visible open/active task data is limited:
- Task List has `Untitled` = To Do and `Take Fig on a walk` = In progress, both last edited 2023-10-27.
- Projects Database has `Sales Team Agents` and `YouTube Upload Automation` = In Progress, plus several July 4 research/project pages without populated status.

**Need:** Share/maintain the real active task database with the Notion integration if daily reports should track open tasks reliably.

## 🟢 Improvements / Healthy Areas

### 10. Memory Wiki Regeneration Healthy

**Status:** ✅ Wiki Daily Regeneration ran today and verified `/root/hermes-wiki/site/index.html` at 26,523 bytes.

Generated totals:
- Sessions: 222
- Messages: 13,801
- Topics: 17

### 11. Core System Health

**Status:** ✅ Base system resources are healthy.
- Disk: 25G used / 49G total (54%)
- RAM: 4.0Gi used / 11Gi total, 7.6Gi available
- Swap: 4.0Ki used / 8.0Gi total
- Load: 1.72 / 1.42 / 1.38
- Uptime: 23 hours
- Failed systemd units: none

## Summary of Current State

```text
Hermes: v0.17.0 (2026.6.19)
Provider: openai-codex / gpt-5.5 in default config
Update backlog: 🔴 2,282 commits behind
STT: ⚠️ configured, end-to-end smoke test still pending
TTS: ✅ Edge TTS configured
Memory: ✅ Honcho provider configured
Skills: ⚠️ 109 direct SKILL.md files vs 101 nightly snapshot count
Sessions: ⚠️ 203 direct default DB sessions vs 274 nightly snapshot count
Messages: 7,030 in default state.db
Wiki: ✅ regenerated today, 222 sessions / 13,801 messages / 17 topics
Cron: ✅ daily briefing / wiki jobs present
Gateway: ✅ active; Discord token and Wazuh MCP warnings present
Dashboard: ⚠️ not listening on 9119
Workspace: ⚠️ port 4000 listening but HTTP check timed out
Systemd failed units: ✅ none
Disk: ✅ 54% used
RAM: ✅ 7.6Gi available
Load: ✅ 1.72 / 1.42 / 1.38
Uptime: ✅ 23h
Notion: ⚠️ API works; no pages updated today; visible active tasks appear stale/limited
```

## Action Items

1. **HIGH** — Schedule an interactive Hermes update maintenance window; backlog is now 2,282 commits behind.
2. Check `hermes-gateway` integration warnings: Discord token invalid and Wazuh MCP unavailable. Keep Wazuh/SentinelTech ops separate from general business reporting.
3. Restart/check dashboard on `127.0.0.1:9119` and workspace responsiveness on `127.0.0.1:4000` if UI access is needed.
4. Apply the Founder-approved low-noise display settings with `hermes config set` during an interactive/admin-safe window.
5. Review `/root/hermes-workspace` uncommitted operations-direct work and decide whether to commit or clean it.
6. Review `/root/honcho` uncommitted bootstrap/service/test files and decide whether to commit, stash, or remove them.
7. Normalize session/skill counting in nightly snapshot vs direct audit/wiki generator so trends are reliable.
8. Enable session pruning or create a weekly prune job after confirming retention policy.
9. Run STT smoke test: Telegram voice note → local transcription → agent receives transcript.
10. Share/maintain the real active Notion task database with the integration if daily reports should include trustworthy task status.
