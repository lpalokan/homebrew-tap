cask "bmad-manager" do
  version "0.1.11"
  sha256 "3d35710ac5e87f97817d25b7441c23c3348e4a0c37ba7f995c13f0c4fbd447cf"

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
