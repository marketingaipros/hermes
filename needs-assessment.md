# Needs Assessment — What Hermes Needs

> Generated: 2026-06-02 | Hermes v0.13.0 | Ubuntu 24.04 LTS
> Last reviewed: 2026-06-07 12:00 PM UTC (daily cron)

## 🔴 Critical Gaps

### 1. Hermes Update Backlog

**Status:** 🔴 3144 commits behind — critical. Jumped 485 commits in 9 days (~54/day, up from ~106/day estimate). Update deferred due to gateway restart risk. Merge conflict risk is now high.

**Note:** Daily cron job `hermes update` exists but requires manual approval. Evaluate if automatic updates with rollback could be enabled in a controlled manner.

### 2. OPENROUTER_API_KEY Validation

**Status:** ✅ Key is present in .env. Config confirms wired to `openrouter` credential pool with `fill_first` strategy. Model set to `qwen/qwen3.6-35b-a3b` (was stepfun/step-3.5-flash — provider switch completed). With 2659 commits of drift, credential injection path should be re-verified on next update.

## 🟡 Important Gaps

### 3. STT Verification

**Status:** ✅ HTTP observable: faster-whisper installed, ffmpeg present, config.yaml shows `stt.enabled: true` with `provider: local` → `model: base`.

**Open question:** Transcript delivery pipeline is unconfirmed. Voice notes hitting messaging platforms may transcribe locally but confirmation of delivery to the agent is not verified. Integration smoke test pending.

### 4. SKILL Count Sanity Check

**Status:** ⚠️ Gap persists — nightly snapshot reports "Count: 96" but actual SKILL.md count is 99 (3 new added since last snapshot). The undercount gap is growing as skills are added faster than snapshots capture them.

No functional impact, but the gap inflates perceived capability in reports. Recommend fixing the snapshot script to count skills accurately.

### 5. Memory Store (Honcho) Health

**Status:** ⚠️ 261 sessions in `~/.hermes/sessions/`. Dispose policy is retention_days: 90 with auto_prune: false on sessions. Session count grew 75 since last audit (230 → 261). Long-term storage growth is unmanaged. Consider enabling pruning or verifying Honcho handles cleanup at a different layer.

### 6. Gateway Load & Errors

**Status:** ✅ Gateway running, load average stable (1.69/1.46/1.33). Minor uptick from last check (0.96/1.23/1.44) but well within normal range. No errors in logs. Gateway RSS increased to ~3.9GB.

## 🟢 Nice-to-Have

### 7. Tools Still Missing

| Tool | Why | Command |
|------|-----|---------|
| jq | JSON processing without python fallback | `apt-get install -y jq` |
| htop | Better system monitoring | `apt-get install -y htop` |
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

Current 1-min load ~0.64 on an apparent 2-core VM. Significantly improved since last review (was 1.12). Monitor if this stays low — likely the memory store refresh loop was optimized or load decreased.

## Summary of Current State

```
| Hermes v0.13.0 (2026.5.7)  🔴 3144 commits behind (↑485 in 9 days, ~54/day)
Provider: OpenRouter → qwen/qwen3.6-35b-a3b
STT: ✅ faster-whisper local (base model)
TTS: ✅ Edge TTS
Memory: ✅ Enabled (Honcho)
Skills: 96 (snapshot count) / 99 (actual SKILL.md files — 3 new added since last snapshot)
Cron: ✅ All 3 jobs running, errors resolved
SaaS Playbook: ✅ Added today (508 lines, 5 files)
Gateway: ✅ Running (3.9GB RSS, ↑0.6GB)
Disk: 29 GiB free / 49 GiB total (38%)
RAM: 2.5Gi used / 11Gi total (~9.2Gi free)
Load: 1.69 / 1.46 / 1.33 (✅ stable, minor uptick)
Sessions: 261 (↑75 since last audit — active work)
Uptime: 19 days
```

## Action Items

1. **URGENT** — Schedule maintenance window to run `hermes update`. 2659 commits behind, growing ~100/day.
2. Fix skill counting in nightly snapshot (now reconciled at 95).
3. Enable session auto-prune or confirm external cleanup mechanism (230 sessions growing).
4. Perform STT end-to-end smoke test (voice note → transcript → agent).
5. Consider adding missing tools (jq, htop, neovim) for ops convenience.