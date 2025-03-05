cask "16x-prompt" do
  arch arm: "arm64", intel: "x64"

  version "0.0.98"

  if Hardware::CPU.arm?
    sha256 "2486c779cef5d2d64a99f1edc3cc9230f74d800ed49cee92c1cdf61fe129b86e"
    url "https://download.16x.engineer/16x+Prompt-#{version}-arm64.dmg"
  else
    sha256 "7f4f4d1bce8622623660d8488aee8beb7d28d15e3b48d58d9339deea32a7bc94"
    url "https://download.16x.engineer/16x+Prompt-#{version}.dmg"
  end

  name "16x Prompt"
  desc "GUI application for 16x prompt"
  homepage "https://16x.engineer"

  livecheck do
    url "https://prompt.16x.engineer/download"
    regex(/(\d+(?:\.\d+)+)/i)
  end

  auto_updates true

  app "16x Prompt.app"

  zap trash: [
    "~/Library/Application Support/16x Prompt",
    "~/Library/Preferences/com.16x.prompt.plist",
    "~/Library/Saved Application State/com.16x.prompt.savedState"
  ]
end
