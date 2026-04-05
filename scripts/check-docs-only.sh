#!/usr/bin/env bash
# Pre-commit hook: warn on docs-only commits
STAGED=$(git diff --cached --name-only)
NON_DOCS=$(echo "$STAGED" | grep -v -E "^(README|CHANGELOG|docs/|.*\.md$)" || true)
if [ -z "$NON_DOCS" ]; then
  echo "Warning: Docs-only commit. Consider batching with the next code change."
  echo "  Staged: $STAGED"
  echo "  To proceed anyway: git commit --no-verify"
  exit 1
fi
