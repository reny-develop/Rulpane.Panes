#!/usr/bin/env bash
#
# Writes the issue each release in releases.tsv is submitted with, and reads every one of them
# with the Gallery's own tool/Admit, in order, into an empty ledger: what the Gallery would
# answer on each issue, and then its check of the whole ledger.
#
#   bash tool/check.sh [<commit>]      (from the top of the repository)
#
# It reads the files as <commit> (HEAD if left out) has them, which is what the Gallery clones,
# and writes the issues to work/issue/, numbered in the order to submit them. It needs the
# Gallery checked out beside this repository, and Rulpane beside that, as the Gallery's tools
# are built.

set -uo pipefail
root=$(cd "$(dirname "$0")/.." && pwd)
gallery=$(cd "$root/../Rulpane.Gallery" && pwd) || exit 2
commit=$(git -C "$root" rev-parse "${1:-HEAD}") || exit 2
work=$(mktemp -d)
trap 'rm -rf "$work"' EXIT

git -C "$root" archive "$commit" | tar -x -C "$work" --one-top-level=checkout || exit 2
dotnet build "$gallery/tool/Admit" -c Release --nologo -v quiet >/dev/null || exit 2
admit() { dotnet run --no-build -c Release --project "$gallery/tool/Admit" -- "$@"; }

rm -rf "$root/work/issue"
mkdir -p "$root/work/issue" "$work/gallery/ledger" "$work/read"
printf '{\n  "releases": [\n  ]\n}\n' > "$work/gallery/ledger/submitted.json"
cd "$work/gallery"

failed=0
n=0
while IFS=$'\t' read -r kind name path sample; do
    [[ -z $kind || $kind == \#* ]] && continue
    n=$((n + 1))
    issue="$root/work/issue/$(printf '%02d' $n)-${name#*/}.md"
    cat > "$issue" <<ISSUE
### Kind

$kind

### Name

$name

### Repository

reny-develop/Rulpane.Panes

### Commit

$commit

### Path

$path

### Sample

${sample:-_No response_}
ISSUE
    out="$work/read/$n"
    if admit read "$issue" --author reny-develop --out "$out" --checkout "$work/checkout" --license MIT-0 >/dev/null 2>"$out.err" \
        && reference=$(admit record "$out"); then
        echo "✓ $reference"
    else
        echo "✕ $name"
        cat "$out/answer.md" "$out.err" 2>/dev/null | sed 's/^/    /'
        failed=1
    fi
done < "$root/releases.tsv"

admit check || failed=1
exit $failed
