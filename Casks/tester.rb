# Signed, notarized macOS package for Tester by Alcyone Systems.
#
# The cask installs the vendor PKG rather than repackaging it, so Homebrew
# owns upgrades for this installation and Tester's own updater stands down
# (see `tester update check`). The two can never fight over the same files.
cask "tester" do
  version "1.0.1"
  sha256 "02441bfc7c8dc2cbac29878e288f8ba007eda81d5e208c87100a39664787e941"

  url "https://github.com/alcyone-systems/tester-releases/releases/download/v#{version}/Tester-#{version}-macos-arm64.pkg",
      verified: "github.com/alcyone-systems/tester-releases/"
  name "Tester"
  desc "On-prem test automation appliance for web, API, Android and iOS"
  homepage "https://alcyone-systems.com/product/"

  depends_on macos: ">= :monterey"
  depends_on arch: :arm64

  pkg "Tester-#{version}-macos-arm64.pkg"

  # Removal mirrors the installer payload: the LaunchAgent that supervises
  # the service, the package receipts, and the two /usr/local symlinks.
  # Operator data (configuration, database, projects, run artifacts) is left
  # in place; `brew uninstall --zap` removes that too.
  uninstall launchctl: "com.alcyonesystems.tester",
            pkgutil:   "com.alcyonesystems.tester.homebrew.*",
            delete:    [
              "/usr/local/bin/tester",
              "/usr/local/bin/tester-native-update",
            ]

  zap trash: [
    "~/Library/Application Support/Alcyone Systems/Tester",
    "~/Library/Logs/Alcyone Systems/Tester",
  ]
end
