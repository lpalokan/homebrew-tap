cask "bmad-manager" do
  version "0.1.15"
  sha256 "60e30187042848b076e0734676f80a52c9bdf0a34f07faccdfbbca5591a4af15"

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
