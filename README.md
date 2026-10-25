# Rulpane.Panes

The views, themes and panesets that come with [Rulpane](https://github.com/reny-develop/Rulpane),
as they are submitted to the [Gallery](https://github.com/reny-develop/Rulpane.Gallery): one file
each, under `reny-develop/<name>`. They are submitted the same way as anybody's and held to the
same checks; nothing about them is official beyond who wrote them.

> **Not submitted yet.** Until they are, Rulpane bundles these same documents under their bare
> names (`v=stages`, `p=expense-claim`).

| Kind | Name | File | Tried in |
| --- | --- | --- | --- |
| view | `reny-develop/approval` | [views/approval.json](views/approval.json) | [samples/approval.json](samples/approval.json) |
| view | `reny-develop/roster` | [views/roster.json](views/roster.json) | [samples/roster.json](samples/roster.json) |
| view | `reny-develop/stages` | [views/stages.json](views/stages.json) | [samples/stages.json](samples/stages.json) |
| view | `reny-develop/progress` | [views/progress.json](views/progress.json) | [samples/progress.json](samples/progress.json) |
| theme | `reny-develop/paper` | [themes/paper.json](themes/paper.json) | [samples/paper.json](samples/paper.json) |
| theme | `reny-develop/meadow` | [themes/meadow.json](themes/meadow.json) | [samples/meadow.json](samples/meadow.json) |
| paneset | `reny-develop/expense-claim` | [panesets/expense-claim.json](panesets/expense-claim.json) | itself |
| paneset | `reny-develop/onboarding` | [panesets/onboarding.json](panesets/onboarding.json) | itself |
| paneset | `reny-develop/sign-off` | [panesets/sign-off.json](panesets/sign-off.json) | itself |
| paneset | `reny-develop/shift-request` | [panesets/shift-request.json](panesets/shift-request.json) | itself |
| paneset | `reny-develop/shift-roster` | [panesets/shift-roster.json](panesets/shift-roster.json) | itself |

A sample is a paneset that leaves out the part the release fills: `v` for a view, `t` for a
theme. The rule sets they name are those Rulpane bundles, which stay bundled.

## The order they are submitted in

[`releases.tsv`](releases.tsv) lists them in that order, views first, then themes, then panesets,
**one at a time, each once the one before it is recorded**. The Gallery numbers each name's
releases from 1, and a sample or a paneset can name only what it already holds, so the themes'
samples and the panesets name the views as `reny-develop/<name>@1` — which is what each view is,
recorded first and once.

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
