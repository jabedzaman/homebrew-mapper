cask "mapper" do
  version "0.0.3"
  sha256 "0550614be9143713f62f9d3203ae6861160e158ec44ca813dd9c88bc4f89b4e3"

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
