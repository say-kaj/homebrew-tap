cask "mycommander" do
  version "1.0.1"
  sha256 "99c8dffae7c1ce4b8907f368eeddc6f21c10e9f8cf924512a7c427c467c03ad8"

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
