cask "bmad-manager" do
  version "0.1.7"
  sha256 "78a0ae87a144ca6b89d96b478a3af2fb800084dcc0cac6066bc6836df856fb77"

  url "https://github.com/lpalokan/bmad-manager/releases/download/v#{version}/bmad-manager.dmg"
  name "bmad-manager"
  desc "Creates new project folders pre-configured with the BMad method"
  homepage "https://github.com/lpalokan/bmad-manager"

  livecheck do
    url :url
    strategy :github_latest
  end

  app "bmad-manager.app"

  postflight do
    system_command "/usr/bin/xattr",
                   args: ["-r", "-d", "com.apple.quarantine", "#{appdir}/bmad-manager.app"]
  end

  zap trash: [
    "~/Library/Application Support/bmad-manager",
  ]
end
