# Needs Assessment — What Hermes Needs

> Generated: 2026-06-02 | Hermes v0.13.0 | Ubuntu 24.04 LTS
> Last reviewed: 2026-07-11 17:01 UTC (daily cron)

## 🔴 Critical Gaps

### 1. Hermes Update Backlog Regressed Again

**Status:** 🔴 Hermes is still `v0.17.0 (2026.6.19)` and now reports **2,787 commits behind**. Yesterday's daily audit recorded **2,714 commits behind**, so upstream drift increased by **+73 commits** since the last check.

**Why it matters:** The local install is materially behind upstream and may be missing fixes/features. Do not run `hermes update` from cron because approval mode denies interactive maintenance work; schedule an interactive maintenance window.

## 🟡 Important Gaps

### 2. Gateway / Integration Warnings Need Verification

**Status:** ⚠️ `hermes-gateway` is active and `/health` returns 200. Current-day `journalctl -p warning..alert` showed **no warning entries**, continuing the improvement from earlier Discord/Wazuh MCP warnings.

**Need:** Verify Discord and Wazuh MCP only if those integrations are needed. Route any Wazuh operational troubleshooting to the SentinelTech read-only analyst profile; do not mix protected SentinelTech data into general business reporting.

### 3. Dashboard / Workspace Availability Drift

**Status:** ⚠️ Workspace and wiki are healthy; dashboard still needs attention:
- Gateway `127.0.0.1:8642`: ✅ healthy, HTTP 200 in 0.005s.
- Wiki `0.0.0.0:9090`: ✅ healthy, HTTP 200 in 0.004s.
- Workspace `127.0.0.1:4000`: ✅ HTTP 200 in 0.026s.
- Dashboard `127.0.0.1:9119`: ❌ not listening; `socat` is still listening on `127.0.0.1:19119`.

**Need:** Restart/check dashboard when UI access is needed.

### 4. Display / Background Noise Setting Still Open

**Status:** ⚠️ Founder approved reducing noise for `display.tool_progress` and `display.background_process_notifications`, but current config still shows:
- `display.tool_progress: all`
- `display.background_process_notifications: all`

**Need:** Apply with the supported config path during an interactive/admin-safe window:
- `hermes config set display.tool_progress off`
- `hermes config set display.background_process_notifications error`

### 5. Metric Consistency: Sessions / Skills

**Status:** ⚠️ Count sources still disagree:
- Nightly snapshot: **275 sessions / 101 skills**.
- Direct default `state.db`: **217 sessions / 7,283 messages**.
- Direct local skills scan: **109 `SKILL.md` files**.
- Profile skills scan: **1,727 profile `SKILL.md` files**.
- Memory wiki generator: verified site output at **26,523 bytes**; prior generator run reported 222 sessions / 13,801 messages / 17 topics.

**Need:** Confirm whether nightly snapshot counts all profiles, JSON sessions, or a different store while direct checks count only the active default profile. Until then, session/skill trend numbers are not apples-to-apples.

### 6. STT Verification

**Status:** ⚠️ Config still shows local STT enabled (`provider: local`, `model: base`) and ffmpeg is present, but end-to-end voice note → transcript → agent delivery remains unverified.

### 7. Session Retention / Pruning

**Status:** ⚠️ `sessions.auto_prune: false`; retention_days is configured but pruning is not automatic. Direct default DB count is now **217 sessions**.

### 8. Open Repo State Outside Hermes Research

**Status:** ⚠️ Two non-`hermes-research` repos still have uncommitted work:
- `/root/hermes-workspace`: operations direct chat/profile files, generated route tree changes, backups, and tests. Repo is also **18 commits behind** origin/main.
- `/root/honcho`: `uv.lock`, bootstrap scripts, service files, compose backups, and tests.

**Need:** Review and either commit, stash, or remove stale test/bootstrap files. This audit intentionally did not modify those repos.

### 9. Notion Task Visibility

**Status:** ⚠️ Notion API works via curl; `ntn` CLI is still not installed. Visible pages edited on 2026-07-11 UTC include `Brain Dump` (05:59 UTC). Notion search for task/project pages remains partially visible and does not expose a reliable active task database.

Visible open/active task context remains limited/stale from prior audits:
- Task List has `(untitled)` = To Do and `Take Fig on a walk` = In progress, both last edited 2023-10-27.
- Projects Database has `Sales Team Agents` and `YouTube Upload Automation` marked In Progress, both last edited 2026-03-24.
- New session activity today added a 15-item founder "plate" list, but it was pasted into chat rather than confirmed as an updated Notion task database.

**Need:** Share/maintain the real active task database with the Notion integration if daily reports should track open tasks reliably.

### 10. Business Strategy / Founder Plate Needs Routing

**Status:** 🟡 Founder pasted a 15-item active plate list today, including social posting process, AI agent blueprint, product explainer videos, Wazuh/sandbox threat-replay ideas, Copilot app with Ashley, Gordon niche/video, Cynthia app packaging, dental society/newspaper promotion, Social Dance app for picnic, sister website automation, flyer-points app idea, and asking Hermes to review what it can do autonomously.

**Need:** Route prioritization and ownership to `main_agent`; route sales/channel items to `cro_revenue_director`; route prospect/account research to `prospect_researcher`; route Wazuh/security operational analysis only to `sentineltech-readonly-analyst`.

## 🟢 Improvements / Healthy Areas

### 11. Memory Wiki Regeneration Healthy

**Status:** ✅ Wiki Daily Regeneration ran today and `/root/hermes-wiki/site/index.html` exists at **26,523 bytes**.

### 12. Core System Health

**Status:** ✅ Base system resources are healthy.
- Disk: 25G used / 49G total (54%)
- RAM: 5.3Gi used / 11Gi total, 6.4Gi available
- Swap: 1.6Gi used / 8.0Gi total
- Load: 1.19 / 0.94 / 0.91
- Uptime: 5 days, 23 hours
- Failed systemd units: none

### 13. Nightly Research Sync Healthy

**Status:** ✅ Nightly Hermes Research Sync ran and committed `01d56ca` (`nightly: state snapshot 2026-07-11 13:00 UTC`). This daily audit has updated the follow-on assessment/audit docs.

## Summary of Current State

```text
Hermes: v0.17.0 (2026.6.19)
Provider: openai-codex / gpt-5.5 in default config
Update backlog: 🔴 2,787 commits behind
STT: ⚠️ configured, end-to-end smoke test still pending
TTS: ✅ Edge TTS configured
Memory: ✅ Honcho provider configured
Skills: ⚠️ 109 direct SKILL.md files vs 101 nightly snapshot count
Profile skills: 1,727 SKILL.md files across profiles
Sessions: ⚠️ 217 direct default state.db sessions vs 275 nightly snapshot count
Messages: 7,283 in default state.db
Wiki: ✅ regenerated today; index verified at 26,523 bytes
Cron: ✅ daily briefing / nightly sync / wiki jobs present
Gateway: ✅ active; no warning+ logs today
Dashboard: ⚠️ not listening on 9119
Workspace: ✅ port 4000 HTTP 200; repo behind origin/main by 18 commits
Systemd failed units: ✅ none
Disk: ✅ 54% used
RAM: ✅ 6.4Gi available
Load: ✅ 1.19 / 0.94 / 0.91
Uptime: ✅ 5d 23h
Notion: ⚠️ API works; `Brain Dump` edited today; visible active task database remains limited/stale
```

## Action Items

1. **HIGH** — Schedule an interactive Hermes update maintenance window; backlog is now 2,787 commits behind.
2. **HIGH** — Send today's 15-item founder plate list to `main_agent` for prioritization, owner assignment, and autonomous-vs-human split.
3. Verify Discord/Wazuh MCP integration health only if needed; keep SentinelTech operational troubleshooting separate.
4. Restart/check dashboard on `127.0.0.1:9119` if UI access is needed.
5. Apply the Founder-approved low-noise display settings with `hermes config set` during an interactive/admin-safe window.
6. Review `/root/hermes-workspace` uncommitted operations-direct work and decide whether to commit/clean; also reconcile its 18-commit lag behind origin/main.
7. Review `/root/honcho` uncommitted bootstrap/service/test files and decide whether to commit, stash, or remove them.
8. Normalize session/skill counting in nightly snapshot vs direct audit/wiki generator so trends are reliable.
9. Enable session pruning or create a weekly prune job after confirming retention policy.
10. Run STT smoke test: Telegram voice note → local transcription → agent receives transcript.
11. Share/maintain the real active Notion task database with the integration if daily reports should include trustworthy task status.
12. Send dental society/newspaper and association partnership ideas to `cro_revenue_director` before external outreach or pricing/discount commitments.
