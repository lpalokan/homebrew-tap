cask "bmad-manager" do
  version "0.1.10"
  sha256 "b8241c726c6d0bcc2b2f2793695e5e747fc92c145046a49b99a57ae39087719d"

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
