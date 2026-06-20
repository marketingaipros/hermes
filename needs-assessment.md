# Needs Assessment — What Hermes Needs

> Generated: 2026-06-02 | Hermes v0.13.0 | Ubuntu 24.04 LTS
> Last reviewed: 2026-06-20 17:01 UTC (daily cron)

## 🔴 Critical Gaps

### 1. Hermes Update Backlog

**Status:** 🔴 723 commits behind — INCREASED from 459 commits (+264). Update backlog continues to grow.

**Note:** Daily cron job `hermes update` exists but requires manual approval. Now 459 commits behind — schedule maintenance window ASAP to run `hermes update`.

### 2. OPENROUTER_API_KEY Validation

**Status:** ✅ Key is present in .env. Config confirms wired to `openrouter` credential pool with `fill_first` strategy. Model set to `tencent/hy3-preview` (confirmed in nightly snapshot 2026-06-15). With 208 commits of drift, credential injection path should be re-verified on next update.

## 🟡 Important Gaps

### 3. STT Verification

**Status:** ✅ HTTP observable: faster-whisper installed, ffmpeg present, config.yaml shows `stt.enabled: true` with `provider: local` → `model: base`.

**Open question:** Transcript delivery pipeline is unconfirmed. Voice notes hitting messaging platforms may transcribe locally but confirmation of delivery to the agent is not verified. Integration smoke test pending.

### 4. SKILL Count Sanity Check

**Status:** ⚠️ Skills count is 99 (from nightly snapshot 2026-06-16). Investigate if count is accurate and what changed.

### 5. Memory Store (Honcho) Health

**Status:** ⚠️ 267 sessions (3 new today). Dispose policy is retention_days: 90 with auto_prune: false on sessions. Session count growing, storage unmanaged. Consider enabling pruning or verifying Honcho cleanup.

### 6. Gateway Load & Errors
**Status:** ✅ Gateway running, load average improved (1.39/1.00/0.89). Down from yesterday's 1.56. No errors in logs. Gateway RSS ~3.9GB.

## 🟢 Nice-to-Have

### 7. Tools Still Missing

| Tool | Why | Command |
|------|-----|---------|
| neovim | In-terminal file editing | `apt-get install -y neovim` |
| gh CLI | GitHub workflow CLIs (node-heavy, skip for now) | skip |

### 8. Cron Jobs Worth Adding

| Job | Schedule | Purpose |
|-----|----------|---------|
| Hermes update check | Daily | `hermes update` with fallback email on failure |
| Disk > 80% alert | Hourly | `df -h /` alert |
| Session prune | Weekly | `hermes sessions prune` |
| Skill curator | Weekly | Auto-archive stale skills |

### 9. Load Average Investigation

Current 1-min load ~1.56 on an apparent 2-core VM. Increased since last review (was 0.96). Monitor — load is trending up, possibly due to increased session activity or gateway memory growth.

## Summary of Current State

```text
| Hermes v0.16.0 (2026.6.5)  🔴 459 commits behind (increased from 356)
|Provider: OpenRouter → tencent/hy3-preview
|STT: ✅ faster-whisper local (base model)
|TTS: ✅ Edge TTS
|Memory: ✅ Enabled (Honcho)
|Skills: 99 (from nightly snapshot 2026-06-17)
|Cron: ✅ Daily briefing job running
|SaaS Playbook: ✅ Added 2026-06-07
|Gateway: ✅ Running (load improved)
|Disk: 27 GiB free / 49 GiB total (44%)
|RAM: 2.3Gi used / 11Gi total (~9.4Gi free)
|Load: TBD (check current)
|Sessions: 264 (from nightly snapshot)
|Uptime: ~25 days
```

## Action Items

1. **🔴 HIGH PRIORITY** — Schedule maintenance window to run `hermes update`. Now 459 commits behind, merge risk increasing.
2. Enable session auto-prune or confirm external cleanup mechanism (264 sessions growing).
3. Perform STT end-to-end smoke test (voice note → transcript → agent).
4. Consider adding missing tools (neovim) for ops convenience.
5. Monitor load average trend — investigate if load stays above 1.5 consistently.