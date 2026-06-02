# Needs Assessment — What Hermes Needs

> Generated: 2026-06-02 | Hermes v0.13.0 | Ubuntu 24.04 LTS
> Last reviewed: 2026-06-02 12:00 PM UTC (daily cron)

## 🔴 Critical Gaps

### 1. Hermes Update Backlog

**Status:** ⚠️ 2075 commits behind — update deferred due to gateway restart risk (kills running agents). The backlog grew from 1987 to 2075 since this morning's snapshot, adding 88 new commits in <24h.

```
hermes update
```

Bug fixes and new features continue to accumulate. At this distance, an update-later strategy becomes increasingly risky — merge conflicts, behavior drift, and unpatched CVEs are realistic concerns. Consider scheduling a maintenance window to run the update, ideally within the next 48h.

**Note:** Daily cron job `hermes update` exists but requires manual approval. Evaluate if automatic updates with rollback could be enabled in a controlled manner.

### 2. OPENROUTER_API_KEY Validation

**Status:** ✅ Key is present in .env (value redacted). Verify it's truly active by hitting the API:

```
# Quick sanity check
curl -s -H "Authorization: Bearer ***" https://openrouter.ai/api/v1/auth/key | jq
```

Config confirms it's wired to `openrouter` credential pool with `fill_first` strategy. With >2000 commits of drift, review credential injection path for any breaking changes.

## 🟡 Important Gaps

### 3. STT Verification

**Status:** ✅ HTTP observable: faster-whisper installed, ffmpeg present, config.yaml shows `stt.enabled: true` with `provider: local` → `model: base`.

**Open question:** Transcript delivery pipeline is unconfirmed. Voice notes hitting messaging platforms may transcribe locally but confirmation of delivery to the agent is not verified. Integration smoke test pending.

### 4. SKILL Count Sanity Check

**Status:** ⚠️ Discrepancy — nightly snapshot shows "Count: 91" but actual SKILL.md count is now 99. `~/.hermes/skills/` has 26 category directories. The mismatch continues to widen (actual skills added). Investigate whether nightlies are undercounting or skills are being added faster than snapshots capture.

No functional impact, but the gap inflates perceived capability in reports. Recommend fixing the snapshot script to count skills accurately or adjust expectations.

### 5. Memory Store (Honcho) Health

**Status:** ⚠️ 186 sessions in `~/.hermes/sessions/`. Dispose policy is retention_days: 90 with auto_prune: false on sessions. This means old sessions are not auto-vacuumed — long-term storage growth in sessions dir is unmanaged. Consider enabling pruning or verifying Honcho handles cleanup at a different layer.

System-audit previously noted 209 sessions; current count is 186, indicating some cleanup may have occurred manually or via external process. Verify the consistency of session lifecycle.

### 6. Gateway Load & Errors

**Status:** ✅ Load average improved: 1min from 1.12 to 0.64, 5min from 1.35 to 0.77, 15min from 1.35 to 0.90. Gateway logs show no recent `skill_manage` YAML frontmatter errors in the past hour. Previous warnings appear resolved orWere transient.

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
Hermes v0.13.0 (2026.5.7)  ⚠️ 2075 commits behind (←88 new overnight)
Provider: OpenRouter → stepfun/step-3.5-flash
STT: ✅ faster-whisper local (base model)
TTS: ✅ Edge TTS
Memory: ✅ Enabled (Honcho)
Skills: 26 category dirs (99+ visible, nightly snapshot count 91)
Cron: ✅ Nightly state snapshot job active
Gateway: ✅ Running (no recent YAML errors)
Disk: 31 GB free / 49 GB total (36%)
RAM: 2.5Gi used / 11Gi total (~8.4Gi free)
Load: 0.64 / 0.77 / 0.90 (✅ improved)
Sessions: 186 (auto-prune: false)
Tailscaled: ✅ Active
```

## Action Items

1. Schedule maintenance window to run `hermes update` within 48h.
2. Fix skill counting in nightly snapshot or document expected variance.
3. Enable session auto-prune or confirm external cleanup mechanism.
4. Perform STT end-to-end smoke test (voice note → transcript → agent).
5. Consider adding missing tools (jq, htop, neovim) for ops convenience.