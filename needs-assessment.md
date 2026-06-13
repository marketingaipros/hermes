# Needs Assessment — What Hermes Needs

> Generated: 2026-06-02 | Hermes v0.13.0 | Ubuntu 24.04 LTS
> Last reviewed: 2026-06-07 12:00 PM UTC (daily cron)

## 🔴 Critical Gaps

### 1. Hermes Update Backlog

**Status:** 🟡 19 commits behind — improved. Reduced from 3144 commits in 2026-06-02. Update deferred due to gateway restart risk, but now low risk.

**Note:** Daily cron job `hermes update` exists but requires manual approval. Evaluate if automatic updates with rollback could be enabled in a controlled manner.

### 2. OPENROUTER_API_KEY Validation

**Status:** ✅ Key is present in .env. Config confirms wired to `openrouter` credential pool with `fill_first` strategy. Model set to `qwen/qwen3.6-35b-a3b` (was stepfun/step-3.5-flash — provider switch completed). With 2659 commits of drift, credential injection path should be re-verified on next update.

## 🟡 Important Gaps

### 3. STT Verification

**Status:** ✅ HTTP observable: faster-whisper installed, ffmpeg present, config.yaml shows `stt.enabled: true` with `provider: local` → `model: base`.

**Open question:** Transcript delivery pipeline is unconfirmed. Voice notes hitting messaging platforms may transcribe locally but confirmation of delivery to the agent is not verified. Integration smoke test pending.

### 4. SKILL Count Sanity Check

**Status:** ✅ Gap resolved — nightly snapshot now reports 101 skills, matching actual SKILL.md count. No action needed.

### 5. Memory Store (Honcho) Health

**Status:** ⚠️ 264 sessions (from nightly snapshot; DB path pending verification). Dispose policy is retention_days: 90 with auto_prune: false on sessions. Session count grew 3 since last audit (261 → 264). Long-term storage growth is unmanaged. Consider enabling pruning or verifying Honcho handles cleanup at a different layer.

### 6. Gateway Load & Errors

**Status:** ✅ Gateway running, load average stable (1.69/1.46/1.33). Minor uptick from last check (0.96/1.23/1.44) but well within normal range. No errors in logs. Gateway RSS increased to ~3.9GB.

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

Current 1-min load ~0.64 on an apparent 2-core VM. Significantly improved since last review (was 1.12). Monitor if this stays low — likely the memory store refresh loop was optimized or load decreased.

## Summary of Current State

```
| Hermes v0.16.0 (2026.6.5)  🟡 19 commits behind (reduced from 3144)
Provider: OpenRouter → tencent/hy3-preview
STT: ✅ faster-whisper local (base model)
TTS: ✅ Edge TTS
Memory: ✅ Enabled (Honcho)
Skills: 101 (snapshot count matches actual SKILL.md files)
Cron: ✅ Daily briefing job running
SaaS Playbook: ✅ Added 2026-06-07
Gateway: ✅ Running (stable load)
Disk: 27 GiB free / 49 GiB total (43%)
RAM: 2.3Gi used / 11Gi total (~9.4Gi free)
Load: 0.96 / 1.23 / 1.44 (✅ stable)
Sessions: 264 (from nightly snapshot)
Uptime: ~21 days
```

## Action Items

1. ** LOW PRIORITY** — Schedule maintenance window to run `hermes update`. Now only 19 commits behind, low merge risk.
2. Enable session auto-prune or confirm external cleanup mechanism (264 sessions growing).
3. Perform STT end-to-end smoke test (voice note → transcript → agent).
4. Consider adding missing tools (neovim) for ops convenience.
5. Verify Hermes session DB path (current command couldn't find DB).