# Needs Assessment — What Hermes Needs

> Generated: 2026-05-28 | Hermes v0.13.0 | Ubuntu 24.04 LTS
> Last reviewed: 2026-05-28 12:00 PM UTC (daily cron)

## 🔴 Critical Gaps

### 1. Hermes Update Backlog

**Status:** ⚠️ 1598 commits behind — update deferred due to gateway restart risk (kills running agents). Update pending manual approval.

```
hermes update
```

Bug fixes and new features are piling up behind a very large gap. At this distance, an update-later strategy becomes risky — merge conflicts, behavior drift, and unpatched CVEs are the realistic concerns.

**Note:** Presently handled via daily cron job hermes update which requires manual approval. Consider scheduling a maintenance window to run the update.

### 2. OPENROUTER_API_KEY Validation

**Status:** ✅ Key is present in .env (value redacted). Verify it's truly active by hitting the API:

```
# Quick sanity check
curl -s -H "Authorization: Bearer $OPENR...KEY" https://openrouter.ai/api/v1/auth/key | jq
```

Config confirms it's wired to `openrouter` credential pool with `fill_first` strategy. With 1598 commits of drift, review credential injection path.

## 🟡 Important Gaps

### 3. STT Verification

**Status:** ✅ HTTP observable: faster-whisper installed, ffmpeg present, config.yaml shows `stt.enabled: true` with `provider: local` → `model: base`.

**Open question:** Transcript delivery pipeline is unconfirmed. Voice notes hitting messaging platforms may transcribe locally but confirmation of delivery to the agent is not verified. Integration smoke test pending.

### 4. SKILL Count Sanity Check

**Status:** ⚠️ Discrepancy — nightly snapshot shows "Count: 90" but actual SKILL.md count is now 98. `~/.hermes/skills/` still has 26 category directories. Investigate whether skill files are nested deeper or snapshot metric undercounts.

No functional impact, but the gap inflates perceived capability in reports.

### 5. Disk Space Trend

**Status:** ✅ 31 GB free (35% used), but 8 GB has been consumed since the May 13 snapshot (39 → 31 free). Watch Hermes logs and journalctl — runaway log rotation or large attachment writes could accelerate this. Log retention is set to 5 MB / backup_count 3.

### 6. Memory Store (Honcho) Health

**Status:** ⚠️ 170 sessions in `~/.hermes/sessions/`. Dispose policy is retention_days: 90 with auto_prune: false on sessions. This means old sessions are not auto-vaced — long-term, storage growth in sessions dir is unmanaged. Consider enabling pruning or verifying Honcho handles this at a different layer.

## 🟢 Nice-to-Have

### 7. Tools Still Missing

| Tool | Why | Command |
|------|-----|---------|
| jq | JSON processing without python fallback | `apt-get install -y jq` |
| htop | Better system monitoring | `apt-get install -y htop` |
| neovim | In-terminal file editing | `apt-get install -y neovim` |
| gh CLI | GitHub workflow CLIs (node-heavy, skip for now) |skip |

### 8. Cron Jobs Worth Adding

| Job | Schedule | Purpose |
|-----|----------|---------|
| Hermes update check | Daily | `hermes update` with fallback email on failure |
| Disk > 80% alert | Hourly | `df -h /` alert |
| Session prune | Weekly | `hermes sessions prune` |
| Skill curator | Weekly | Auto-archive stale skills |

### 9. Load Average Investigation

Current 1-min load ~1.29 on an apparent 2-core (vm_stat says 2 CPUs or Proxmox CT). Improved since last review. Monitor if this climbs — likely the memory store refresh loop.

## Summary of Current State

```
Hermes v0.13.0 (2026.5.7)  ⚠️ 1598 commits behind
Provider: OpenRouter → stepfun/step-3.5-flash
STT: ✅ faster-whisper local (base model)
TTS: ✅ Edge TTS
Memory: ✅ Enabled (Honcho)
Skills: 26 category dirs (98+ visible, nightly snapshot count 90)
Cron: ✅ Nightly state snapshot job active
Gateway: ✅ Running
Disk: 31 GB free / 49 GB total (35%)
RAM: ~9.4 GB free / 11 GB total (2.3 GB used)
Load: 1.29 / 1.08 / 1.03 (improved)
Sessions: 170 (auto-prune: false)
Tailscaled: ✅ Active
```