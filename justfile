# Snapshot recipes for the live oh-my-posh theme. Run `archive` after editing, before committing.
# A snapshot holds the state the edits started from, so it is read out of HEAD, never the working tree.

set quiet := true
# Windows has no `sh`, which just reaches for by default; use Git Bash instead (archive/diff need it anyway).
set windows-shell := ["C:/Program Files/Git/bin/bash.exe", "-cu"]

theme := "Moonlight"
themes_dir := source_directory() / "themes"

# List recipes (default when no recipe is given)
[no-cd]
list:
    @just -f "{{ source_file() }}" --list

# Save the pre-edit theme as (YYYYMMDDHHMMSS)<theme>.omp.json, leaving older snapshots untouched
[no-cd]
archive:
    #!/usr/bin/env bash
    set -euo pipefail
    cd "{{ themes_dir }}"
    live="{{ theme }}.omp.json"
    if git diff --quiet -- "$live"; then
      echo "no uncommitted edits to $live, nothing archived"
      exit 0
    fi
    baseline=$(mktemp)
    trap 'rm -f "$baseline"' EXIT
    # git show skips the checkout filter, so the blob arrives LF while the tree is CRLF.
    git show "HEAD:./$live" > "$baseline"
    if [[ $(wc -c < "$live") -ne $(tr -d '\r' < "$live" | wc -c) ]]; then
      sed -i 's/$/\r/' "$baseline"
    fi
    latest=$(ls -1 "("*")$live" 2>/dev/null | sort | tail -1 || true)
    if [[ -n "$latest" ]] && cmp -s "$latest" "$baseline"; then
      echo "baseline already archived as $latest"
      exit 0
    fi
    stamp=$(date +%Y%m%d%H%M%S)
    cp "$baseline" "($stamp)$live"
    echo "archived ($stamp)$live, the state before the current edits"

# Diff the newest snapshot against the live theme
[no-cd]
diff:
    #!/usr/bin/env bash
    set -euo pipefail
    cd "{{ themes_dir }}"
    latest=$(ls -1 "("*"){{ theme }}.omp.json" 2>/dev/null | sort | tail -1 || true)
    if [[ -z "$latest" ]]; then
      echo "no snapshots yet"
      exit 0
    fi
    echo "$latest -> {{ theme }}.omp.json"
    diff -u "$latest" "{{ theme }}.omp.json" || true
