#!/usr/bin/env bash
# Nightly sync: snapshot Hermes state and push to GitHub
# Intended to run via cron, uses GITHUB_TOKEN from ~/.hermes/.env
set -euo pipefail

REPO_DIR="/root/hermes-research"
HERMES_HOME="${HERMES_HOME:-$HOME/.hermes}"
TIMESTAMP=$(date -u +"%Y-%m-%d %H:%M UTC")

# Load GitHub token from .env
if [ -f "$HERMES_HOME/.env" ]; then
    set -a
    source <(grep -v '^#' "$HERMES_HOME/.env" | grep -E '^GITHUB_TOKEN=')
    set +a
fi

cd "$REPO_DIR"

# Pull latest
git pull origin main 2>/dev/null || true

# --- Collect state snapshot ---
{
    echo "# Hermes Nightly State — $TIMESTAMP"
    echo ""
    echo "## Version"
    hermes --version 2>/dev/null || echo "hermes not available"
    echo ""
    echo "## Skills"
    echo "- Count: $(find "$HERMES_HOME/skills" -name 'SKILL.md' -maxdepth 3 2>/dev/null | wc -l)"
    echo ""
    echo "## Sessions"
    if [ -d "$HERMES_HOME/sessions" ]; then
        echo "- Count: $(ls "$HERMES_HOME/sessions"/*.json 2>/dev/null | wc -l)"
    else
        echo "- No sessions directory"
    fi
    echo ""
    echo "## Config (secrets redacted)"
    if [ -f "$HERMES_HOME/config.yaml" ]; then
        sed 's/\(api_key:\s*\).*/\1[REDACTED]/' "$HERMES_HOME/config.yaml"
    fi
    echo ""
    echo "## System"
    echo '```'
    df -h / | tail -1
    free -h | head -2
    echo '```'
    echo ""
    echo "## Cron Jobs"
    hermes cron list 2>/dev/null || echo "cron not available"
} > nightly-snapshot.md

# Update timestamp in README
sed -i "s|<!-- NIGHTLY_SYNC_TIMESTAMP -->.*<!-- /NIGHTLY_SYNC_TIMESTAMP -->|<!-- NIGHTLY_SYNC_TIMESTAMP -->$TIMESTAMP<!-- /NIGHTLY_SYNC_TIMESTAMP -->|" README.md

# --- Commit and push ---
git add -A
if git diff --cached --quiet; then
    # Silent exit — nothing changed, no notification
    exit 0
fi

git commit -m "nightly: state snapshot $TIMESTAMP"
git push origin main
echo "Hermes nightly sync pushed — $TIMESTAMP"
