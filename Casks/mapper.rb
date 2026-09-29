cask "mapper" do
  version "0.0.4"
  sha256 "52b49fb1dac02fd43169802db206326804cb706e22eb1a990f3d20d5dea4c5ef"

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
