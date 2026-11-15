cask "mycommander" do
  version "1.0.0"
  sha256 "40218507cacdd726ad9f648b613dfa3554607b2ba23dd3a03ef9615f58c1e314"

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
