# Needs Assessment — What Hermes Needs

> Generated: 2026-06-02 | Hermes v0.13.0 | Ubuntu 24.04 LTS
> Last reviewed: 2026-07-12 17:01 UTC (daily cron)

## 🔴 Critical Gaps

### 1. Hermes Update Backlog Regressed Again

**Status:** 🔴 Hermes is still `v0.17.0 (2026.6.19)` and now reports **2,874 commits behind** from the live CLI check. The 2026-07-12 nightly snapshot recorded **2,825 commits behind**, while yesterday's daily audit recorded **2,787 commits behind**. Upstream drift is still increasing.

**Why it matters:** The local install is materially behind upstream and may be missing fixes/features. Do not run `hermes update` from cron because approval mode denies interactive maintenance work; schedule an interactive maintenance window.

## 🟡 Important Gaps

### 2. Dashboard / Workspace Availability Drift

**Status:** ⚠️ Gateway, workspace, and wiki are healthy; dashboard still needs attention:
- Gateway `127.0.0.1:8642`: ✅ active, `/health` HTTP 200 in 0.019s.
- Wiki `127.0.0.1:9090`: ✅ HTTP 200 in 0.002s.
- Workspace `127.0.0.1:4000`: ✅ HTTP 200 in 0.194s.
- Dashboard `127.0.0.1:9119`: ❌ not listening.

**Need:** Restart/check dashboard when UI access is needed.

### 3. Gateway / Integration Warnings Need Verification

**Status:** ✅ `hermes-gateway` is active and current-day `journalctl -p warning..alert` showed **no warning entries**.

**Need:** Verify Discord and Wazuh MCP only if those integrations are needed. Route any Wazuh operational troubleshooting to the SentinelTech read-only analyst profile; do not mix protected SentinelTech data into general business reporting.

### 4. Display / Background Noise Setting Still Open

**Status:** ⚠️ Founder-approved noise reduction still appears unapplied in config:
- `display.tool_progress: all`
- `display.background_process_notifications: all`

**Need:** Apply with the supported config path during an interactive/admin-safe window:
- `hermes config set display.tool_progress off`
- `hermes config set display.background_process_notifications error`

### 5. Metric Consistency: Sessions / Skills

**Status:** ⚠️ Count sources still disagree:
- Nightly snapshot: **276 sessions / 101 skills**.
- Direct default `state.db`: **219 sessions / 7,320 messages**.
- Direct local skills scan: **109 `SKILL.md` files**.
- Profile skills scan: **1,727 profile `SKILL.md` files**.
- Memory wiki output still verified at **26,523 bytes**, but the file timestamp remains 2026-07-10 even though a wiki cron session existed today.

**Need:** Confirm whether nightly snapshot counts all profiles, JSON sessions, or a different store while direct checks count only the active default profile. Until then, session/skill trend numbers are not apples-to-apples.

### 6. STT Verification

**Status:** ⚠️ Config still shows local STT enabled (`provider: local`, `model: base`) and ffmpeg is present, but end-to-end voice note → transcript → agent delivery remains unverified.

### 7. Session Retention / Pruning

**Status:** ⚠️ `sessions.auto_prune: false`; retention_days is configured but pruning is not automatic. Direct default DB count is now **219 sessions**.

### 8. Open Repo State Outside Hermes Research

**Status:** ⚠️ Two non-`hermes-research` repos still have uncommitted work:
- `/root/hermes-workspace`: operations direct chat/profile files, generated route tree changes, backups, and tests. Repo is also **18 commits behind** origin/main.
- `/root/honcho`: `uv.lock`, bootstrap scripts, service files, compose backups, and tests.

**Need:** Review and either commit, stash, or remove stale test/bootstrap files. This audit intentionally did not modify those repos.

### 9. Notion Task Visibility

**Status:** ⚠️ Notion API works via curl; `ntn` CLI is still not installed. No pages were edited on 2026-07-12 UTC in the visible Notion scope. Recent visible pages include `Brain Dump` (2026-07-11) and `New LinkedIN App` (2026-07-10).

Visible open/active task context:
- Projects Database: `Sales Team Agents` = In Progress, `YouTube Upload Automation` = In Progress, both last edited 2026-03-24.
- Task List: `(untitled)` = To Do and `Take Fig on a walk` = In progress, both last edited 2023-10-27.
- The visible Projects Database also contains recent pages like `New LinkedIN App`, `Healthcare SMB Security Market Report`, `Target Market`, `Wazuh Vs Crowdstrike`, and `Brain Dump`, but most have no visible status value.

**Need:** Share/maintain the real active task database with the Notion integration if daily reports should track open tasks reliably.

### 10. Business Strategy / Founder Plate Needs Routing

**Status:** 🟡 From the latest Founder session activity, the active plate still includes social posting process, AI agent blueprint, product explainer videos, Wazuh/sandbox threat-replay ideas, Copilot app with Ashley, Gordon niche/video, Cynthia app packaging, dental society/newspaper promotion, Social Dance app for picnic, sister website automation, flyer-points app idea, and asking Hermes to review what it can do autonomously.

**Need:** Route prioritization and ownership to `main_agent`; route sales/channel items to `cro_revenue_director`; route prospect/account research to `prospect_researcher`; route Wazuh/security operational analysis only to `sentineltech-readonly-analyst`.

## 🟢 Improvements / Healthy Areas

### 11. Nightly Research Sync Healthy

**Status:** ✅ Nightly Hermes Research Sync ran and committed `f502ecc` (`nightly: state snapshot 2026-07-12 13:00 UTC`).

### 12. Core System Health

**Status:** ✅ Base system resources remain healthy.
- Disk: 25G used / 49G total (54%)
- RAM: 5.2Gi used / 11Gi total, 6.5Gi available
- Swap: 1.7Gi used / 8.0Gi total
- Load: 1.80 / 1.56 / 1.53
- Uptime: 6 days, 23 hours
- Failed systemd units: none

## Summary of Current State

```text
Hermes: v0.17.0 (2026.6.19)
Provider: openai-codex / gpt-5.5 in default config
Update backlog: 🔴 2,874 commits behind live; 2,825 in nightly snapshot
STT: ⚠️ configured, end-to-end smoke test still pending
TTS: ✅ Edge TTS configured
Memory: ✅ Honcho provider configured
Skills: ⚠️ 109 direct SKILL.md files vs 101 nightly snapshot count
Profile skills: 1,727 SKILL.md files across profiles
Sessions: ⚠️ 219 direct default state.db sessions vs 276 nightly snapshot count
Messages: 7,320 in default state.db
Wiki: ⚠️ index verified at 26,523 bytes, but mtime still 2026-07-10
Cron: ✅ founder approval alert job present; daily jobs running by session history
Gateway: ✅ active; no warning+ logs today
Dashboard: ⚠️ not listening on 9119
Workspace: ✅ port 4000 HTTP 200; repo behind origin/main by 18 commits
Systemd failed units: ✅ none
Disk: ✅ 54% used
RAM: ✅ 6.5Gi available
Load: ✅ moderate at 1.80 / 1.56 / 1.53
Uptime: ✅ 6d 23h
Notion: ⚠️ API works; no visible pages edited today; active task visibility limited/stale
```

## Action Items

1. **HIGH** — Schedule an interactive Hermes update maintenance window; live backlog is now 2,874 commits behind.
2. **HIGH** — Send the Founder plate list to `main_agent` for prioritization, owner assignment, and autonomous-vs-human split.
3. Restart/check dashboard on `127.0.0.1:9119` if UI access is needed.
4. Apply the Founder-approved low-noise display settings with `hermes config set` during an interactive/admin-safe window.
5. Review `/root/hermes-workspace` uncommitted operations-direct work and reconcile its 18-commit lag behind origin/main.
6. Review `/root/honcho` uncommitted bootstrap/service/test files and decide whether to commit, stash, or remove them.
7. Normalize session/skill counting in nightly snapshot vs direct audit/wiki generator so trends are reliable.
8. Enable session pruning or create a weekly prune job after confirming retention policy.
9. Run STT smoke test: Telegram voice note → local transcription → agent receives transcript.
10. Share/maintain the real active Notion task database with the integration if daily reports should include trustworthy task status.
11. Verify why wiki index mtime is still 2026-07-10 despite today's wiki cron session.
12. Route dental society/newspaper and association partnership ideas to `cro_revenue_director` before external outreach or pricing/discount commitments.
