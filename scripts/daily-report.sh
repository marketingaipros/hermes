#!/usr/bin/env bash
# Daily Hermes research report — LLM-driven analysis of state changes
# This is designed to be run WITH an agent (no_agent=false) so the LLM
# can inspect state and write meaningful analysis.
set -euo pipefail

REPO_DIR="/root/hermes-research"
TIMESTAMP=$(date -u +"%Y-%m-%d %H:%M UTC")

cd "$REPO_DIR"
git pull origin main 2>/dev/null || true

echo "DAILY REPORT TASK: Analyze the current Hermes state in /root/hermes-research/ and /root/.hermes/. Compare against the previous nightly-snapshot.md. Write an updated needs-assessment.md highlighting any new gaps, regressions, or improvements since last check. Update system-audit.md with current metrics. Commit and push any changes to main. Report a brief summary of what changed."
