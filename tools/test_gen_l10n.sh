#!/bin/bash

set -e

# This should be set on codemagic
if [ -z "$FLUTTER_ROOT" ]; then
  echo '$FLUTTER_ROOT env var is not set!'
  exit 1
fi

SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd -P )"

REPO_ROOT="$(dirname "$SCRIPT_DIR")"

DART="$FLUTTER_ROOT/bin/cache/dart-sdk/bin/dart"
DARTFMT="$FLUTTER_ROOT/bin/cache/dart-sdk/bin/dartfmt"
GEN_L10N="$REPO_ROOT/tools/gen_l10n.dart"
ARB_DIR="$REPO_ROOT/lib/src/l10n"

# Generate localizations
"$DART" "$GEN_L10N" --arb-dir "$ARB_DIR"

# Format localizations
"$DARTFMT" -w "$ARB_DIR"

# Check if running this script introduced a change since HEAD
if ! git diff --quiet HEAD "$ARB_DIR"; then
  git diff HEAD "$ARB_DIR"
  echo -e "\ntest_gen_l10n test failed!"
  exit 1
fi

echo 'test_gen_l10n test succeeded.'
