cask "mycommander" do
  version "1.2.6"
  sha256 "5252abdcc732c0f7762c5b77fab385463edb306b5539c0c56a7092393ee44dfe"

  url "https://github.com/say-kaj/MyCommander/releases/download/v#{version}/myCommander-#{version}-macos-arm64.zip"
  name "myCommander"
  desc "Native two-panel file manager modelled on Midnight Commander"
  homepage "https://github.com/say-kaj/MyCommander"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on arch: :arm64

  app "myCommander.app"

  # Ad-hoc signed, not notarized: drop the quarantine flag so it opens directly.
  postflight do
    system_command "/usr/bin/xattr", args: ["-dr", "com.apple.quarantine", "#{appdir}/myCommander.app"]
  end

  zap trash: "~/Library/Application Support/myCommander"
end
