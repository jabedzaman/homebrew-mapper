cask "mapper" do
  version "0.0.5"
  sha256 "1a7542e6718301b09563149656f3b9c94924e6c844e5dd0d6f2c11f2a509b422"

  arch arm: "aarch64"
  depends_on arch: :arm64
  depends_on macos: ">= :sonoma"

  url "https://github.com/jabedzaman/mapper/releases/download/v#{version}/Mapper_#{version}_#{arch}.dmg"
  name "Mapper"
  desc "Menu bar SSH tunnel manager"
  homepage "https://github.com/jabedzaman/mapper"

  app "Mapper.app"

  # Ad-hoc signed only (no Developer ID) — strip the quarantine flag Gatekeeper
  # sets on downloaded files, otherwise macOS refuses to open it.
  postflight do
    system_command "/usr/bin/xattr",
                    args: ["-cr", "#{appdir}/Mapper.app"],
                    sudo: false
  end

  zap trash: [
    "~/Library/Application Support/dev.jabed.mapper",
    "~/Library/Preferences/dev.jabed.mapper.plist",
    "~/Library/Saved Application State/dev.jabed.mapper.savedState",
  ]
end
