# Rulpane.Panes

The views, themes and panesets that come with [Rulpane](https://github.com/reny-develop/Rulpane),
as they are submitted to the [Gallery](https://github.com/reny-develop/Rulpane.Gallery): one file
each, under `reny-develop/<name>`. They are submitted the same way as anybody's and held to the
same checks; nothing about them is official beyond who wrote them.

> **Not submitted yet.** Until they are, Rulpane bundles these same documents under their bare
> names (`v=split-bill`, `p=split-bill`).

| Kind | Name | File | Tried in |
| --- | --- | --- | --- |
| view | `reny-develop/split-bill-view` | [views/split-bill.json](views/split-bill.json) | [samples/split-bill.json](samples/split-bill.json) |
| view | `reny-develop/split-bill-ja-view` | [views/split-bill-ja.json](views/split-bill-ja.json) | [samples/split-bill-ja.json](samples/split-bill-ja.json) |
| view | `reny-develop/packing-list-view` | [views/packing-list.json](views/packing-list.json) | [samples/packing-list.json](samples/packing-list.json) |
| view | `reny-develop/packing-list-ja-view` | [views/packing-list-ja.json](views/packing-list-ja.json) | [samples/packing-list-ja.json](samples/packing-list-ja.json) |
| view | `reny-develop/scoreboard-view` | [views/scoreboard.json](views/scoreboard.json) | [samples/scoreboard.json](samples/scoreboard.json) |
| view | `reny-develop/scoreboard-ja-view` | [views/scoreboard-ja.json](views/scoreboard-ja.json) | [samples/scoreboard-ja.json](samples/scoreboard-ja.json) |
| view | `reny-develop/reversi-view` | [views/reversi.json](views/reversi.json) | [samples/reversi.json](samples/reversi.json) |
| view | `reny-develop/reversi-ja-view` | [views/reversi-ja.json](views/reversi-ja.json) | [samples/reversi-ja.json](samples/reversi-ja.json) |
| view | `reny-develop/minesweeper-view` | [views/minesweeper.json](views/minesweeper.json) | [samples/minesweeper.json](samples/minesweeper.json) |
| view | `reny-develop/minesweeper-ja-view` | [views/minesweeper-ja.json](views/minesweeper-ja.json) | [samples/minesweeper-ja.json](samples/minesweeper-ja.json) |
| view | `reny-develop/chess-view` | [views/chess.json](views/chess.json) | [samples/chess.json](samples/chess.json) |
| view | `reny-develop/chess-ja-view` | [views/chess-ja.json](views/chess-ja.json) | [samples/chess-ja.json](samples/chess-ja.json) |
| theme | `reny-develop/paper` | [themes/paper.json](themes/paper.json) | [samples/paper.json](samples/paper.json) |
| theme | `reny-develop/meadow` | [themes/meadow.json](themes/meadow.json) | [samples/meadow.json](samples/meadow.json) |
| paneset | `reny-develop/split-bill` | [panesets/split-bill.json](panesets/split-bill.json) | itself |
| paneset | `reny-develop/split-bill-ja` | [panesets/split-bill-ja.json](panesets/split-bill-ja.json) | itself |
| paneset | `reny-develop/packing-list` | [panesets/packing-list.json](panesets/packing-list.json) | itself |
| paneset | `reny-develop/packing-list-ja` | [panesets/packing-list-ja.json](panesets/packing-list-ja.json) | itself |
| paneset | `reny-develop/scoreboard` | [panesets/scoreboard.json](panesets/scoreboard.json) | itself |
| paneset | `reny-develop/scoreboard-ja` | [panesets/scoreboard-ja.json](panesets/scoreboard-ja.json) | itself |
| paneset | `reny-develop/reversi` | [panesets/reversi.json](panesets/reversi.json) | itself |
| paneset | `reny-develop/reversi-ja` | [panesets/reversi-ja.json](panesets/reversi-ja.json) | itself |
| paneset | `reny-develop/minesweeper` | [panesets/minesweeper.json](panesets/minesweeper.json) | itself |
| paneset | `reny-develop/minesweeper-ja` | [panesets/minesweeper-ja.json](panesets/minesweeper-ja.json) | itself |
| paneset | `reny-develop/chess` | [panesets/chess.json](panesets/chess.json) | itself |
| paneset | `reny-develop/chess-ja` | [panesets/chess-ja.json](panesets/chess-ja.json) | itself |

A sample is a paneset that leaves out the part the release fills: `v` for a view, `t` for a
theme. The rule sets they name are those Rulpane bundles, which stay bundled.

## The order they are submitted in

[`releases.tsv`](releases.tsv) lists them in that order, views first, then themes, then panesets,
**one at a time, each once the one before it is recorded**. The Gallery numbers each name's
releases from 1, and a sample or a paneset can name only what it already holds, so the themes'
samples and the panesets name the views as `reny-develop/<name>-view@1` — which is what each view
is, recorded first and once. A view carries `-view` because a Gallery name is one kind for good,
and the paneset of the same screen holds the bare name a link opens: `p=reny-develop/split-bill`.

## Checking them

```sh
bash tool/check.sh [<commit>]
```

It reads the files as the commit has them (HEAD if left out), which is what the Gallery clones,
writes the issue each one is submitted with to `work/issue/`, numbered in the order to submit
them, and reads every one in that order with the Gallery's own `tool/Admit` into an empty
ledger, then runs its check over the whole ledger. It needs the Gallery checked out beside this
repository, and Rulpane beside that.

To submit, push, run it with the pushed commit, and open each issue in turn, waiting for the
Gallery's answer before the next — from its submit page with the fields in the file, or:

```sh
gh issue create -R reny-develop/Rulpane.Gallery --label submission --title "Submit reny-develop/approval" --body-file work/issue/01-approval.md
```

## License

[MIT-0](LICENSE): copy any of them, change it and submit it as your own, and say nothing.
