# Alcyone Systems Homebrew tap

Signed, notarized macOS packages for [Tester](https://alcyone-systems.com/product/),
an on-prem test automation appliance.

```sh
brew install --cask alcyone-systems/tap/tester
```

Homebrew owns updates for an installation made this way: `brew upgrade` applies
them, and Tester's own updater stands down so the two never compete for the
same files. Run `tester update check` to see which channel an installation is
on.

Every package is signed with an Apple Developer ID Installer certificate,
notarized by Apple and stapled, and is described by the same signed release
index the appliance itself verifies before it will stage an update.
