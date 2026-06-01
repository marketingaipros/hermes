# Needs Assessment — What Hermes Needs

> Generated: 2026-06-01 | Hermes v0.13.0 | Ubuntu 24.04 LTS
> Last reviewed: 2026-06-01 12:00 PM UTC (daily cron)

## 🔴 Critical Gaps

### 1. Hermes Update Backlog

**Status:** ⚠️ 1987 commits behind — update deferred due to gateway restart risk (kills running agents). Update pending manual approval. The backlog grew from 1928 to 1987 since the morning snapshot.

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

Config confirms it's wired to `openrouter` credential pool with `fill_first` strategy. With 1928 commits of drift, review credential injection path.

## 🟡 Important Gaps

### 3. STT Verification

**Status:** ✅ HTTP observable: faster-whisper installed, ffmpeg present, config.yaml shows `stt.enabled: true` with `provider: local` → `model: base`.

**Open question:** Transcript delivery pipeline is unconfirmed. Voice notes hitting messaging platforms may transcribe locally but confirmation of delivery to the agent is not verified. Integration smoke test pending.

### 4. SKILL Count Sanity Check

**Status:** ⚠️ Discrepancy — nightly snapshot shows "Count: 91" but actual SKILL.md count is now 99. `~/.hermes/skills/` still has 26 category directories. The mismatch continues to widen (actual skills added). Investigate whether nightlies are undercounting or skills are being added faster than snapshots capture.

No functional impact, but the gap inflates perceived capability in reports.

### 5. Disk Space Trend

**Status:** ✅ 31 GB free (35% used), but 8 GB has been consumed since the May 13 snapshot (39 → 31 free). Watch Hermes logs and journalctl — runaway log rotation or large attachment writes could accelerate this. Log retention is set to 5 MB / backup_count 3.

### 6. Memory Store (Honcho) Health

**Status:** ⚠️ 209 sessions in `~/.hermes/sessions/`. Dispose policy is retention_days: 90 with auto_prune: false on sessions. This means old sessions are not auto-vaced — long-term, storage growth in sessions dir is unmanaged. Consider enabling pruning or verifying Honcho handles this at a different layer.

### 7. Gateway Load & Errors

**Status:** ⚠️ Load average (1min) climbed from ~0.96 to 1.12 since morning; 5/15min averages also up. Gateway logs show repeated `skill_manage` errors about malformed YAML frontmatter in some SKILL.md files. This could indicate a skill upload with incorrect format or a corrupted skill file. Errors trigger tool loop warnings but are non-fatal. Investigate the offending skill file(s) and correct or remove them.

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

Current 1-min load ~0.96 on an apparent 2-core (vm_stat says 2 CPUs or Proxmox CT). Improved since last review. Monitor if this climbs — likely the memory store refresh loop.

## Summary of Current State

```
Hermes v0.13.0 (2026.5.7)  ⚠️ 1987 commits behind
Provider: OpenRouter → stepfun/step-3.5-flash
STT: ✅ faster-whisper local (base model)
TTS: ✅ Edge TTS
Memory: ✅ Enabled (Honcho)
Skills: 26 category dirs (99+ visible, nightly snapshot count 91)
Cron: ✅ Nightly state snapshot job active
Gateway: ✅ Running (with skill_manage YAML warnings)
Disk: 31 GB free / 49 GB total (36%)
RAM: ~8.4 GB free / 11 GB total (~2.6 GB used)
Load: 1.12 / 1.35 / 1.35 (elevated)
Sessions: 209 (auto-prune: false)
Tailscaled: ✅ Active
```