# Needs Assessment — What Hermes Needs

> Generated: 2026-06-02 | Hermes v0.13.0 | Ubuntu 24.04 LTS
> Last reviewed: 2026-06-21 17:01 UTC (daily cron)

## 🔴 Critical Gaps

### 1. Hermes Update Backlog

**Status:** 🔴 842 commits behind — INCREASED from 723 commits (+119) since the 2026-06-20 daily audit / 2026-06-21 nightly snapshot context.

**Why it matters:** Backlog is still growing daily, raising merge/update risk. `hermes update` requires a Founder-approved maintenance window because cron approval mode denies interactive update work.

### 2. Nginx Service Failed

**Status:** 🔴 `nginx.service` is failed. Current failure reason: port 80/443 already bound by `docker-proxy`, so nginx cannot bind.

**Impact:** Not blocking Hermes gateway/dashboard/workspace, but it leaves systemd reporting a failed service and could confuse future web routing/debugging.

## 🟡 Important Gaps

### 3. Metric Consistency: Sessions / Skills

**Status:** ⚠️ Nightly snapshot reports 264 sessions and 100 skills. Current direct checks show default `state.db` has 179 sessions / 6,609 messages and `/root/.hermes/skills` has 108 `SKILL.md` files.

**Need:** Confirm whether nightly snapshot counts all profiles / historical stores while direct checks count only the active default profile. Until then, session/skill trend numbers are not apples-to-apples.

### 4. STT Verification

**Status:** ⚠️ Config still shows local STT enabled (`provider: local`, `model: base`) and ffmpeg is present, but end-to-end voice note → transcript → agent delivery remains unverified.

### 5. Session Retention / Pruning

**Status:** ⚠️ `sessions.auto_prune: false`; retention_days is configured but pruning is not automatic. Direct default DB count is 179 sessions; snapshot path previously showed 264.

### 6. Open Repo State Outside Hermes Research

**Status:** ⚠️ `/root/honcho` has uncommitted changes and untracked files (`uv.lock`, bootstrap scripts, service files, tests). No commit was made there by this job.

## 🟢 Improvements / Healthy Areas

### 7. Core Hermes Services

**Status:** ✅ `hermes-gateway` is active. Local workspace stack is listening on expected ports:
- Gateway: `127.0.0.1:8642`
- Dashboard: `127.0.0.1:9119`
- Workspace: `127.0.0.1:4000`
- Wiki: `0.0.0.0:9090`

### 8. System Resources

**Status:** ✅ Disk and memory are healthy.
- Disk: 24G used / 49G total (50%)
- RAM: 3.2Gi used / 11Gi total, 8.5Gi available
- Load: 0.66 / 0.92 / 1.00
- Uptime: 29 days, 15 hours

### 9. Notion Check

**Status:** ✅ Notion API token works. Search found no pages updated today and no obvious active/open task database exposed to the integration.

## Summary of Current State

```text
Hermes: v0.16.0 (2026.6.5)
Provider: openai-codex / gpt-5.5 in default config
Update backlog: 🔴 842 commits behind (+119)
STT: ⚠️ configured, end-to-end smoke test still pending
TTS: ✅ Edge TTS configured
Memory: ✅ Honcho provider configured
Skills: ⚠️ 108 direct SKILL.md files vs 100 nightly snapshot count
Sessions: ⚠️ 179 direct default DB sessions vs 264 nightly snapshot count
Cron: ✅ daily briefing / wiki jobs present
Gateway: ✅ active
Nginx: 🔴 failed, docker-proxy owns 80/443
Disk: ✅ 50% used
RAM: ✅ 8.5Gi available
Load: ✅ 0.66 / 0.92 / 1.00
Uptime: ✅ 29d 15h
```

## Action Items

1. **🔴 HIGH PRIORITY** — Schedule Hermes update maintenance window; backlog is now 842 commits behind.
2. Decide whether nginx is needed. If not, disable it; if yes, resolve conflict with docker-proxy on ports 80/443.
3. Normalize session/skill counting in nightly snapshot vs direct audit so trends are reliable.
4. Enable session pruning or create a weekly prune job after confirming retention policy.
5. Run STT smoke test: Telegram voice note → local transcription → agent receives transcript.
6. Review `/root/honcho` uncommitted changes and either commit, stash, or remove stale test/bootstrap files.
