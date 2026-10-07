# Charter Homebrew tap

Homebrew formulas for the `charter` CLI, which connects coding agents to [Charter](https://charter.build) workspaces.

## Install

```sh
brew install charter-build/tap/charter          # stable
brew install charter-build/tap/charter-nightly  # nightly
```

Both install the `charter` command, so only one can be installed at a time. `charter@nightly` is an alias for `charter-nightly`.

Then sign in:

```sh
charter auth login
```

## Update

```sh
brew upgrade charter          # or charter-nightly
```

## Platforms

macOS (Apple silicon and Intel) and Linux (arm64 and x64).

The formulas are written by Charter's release pipeline; edits made here are replaced by the next release.
