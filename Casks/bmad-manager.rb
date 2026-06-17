cask "bmad-manager" do
  version "0.1.6"
  sha256 "70970c4dde77be3f329bf0197205b66edf09cfe7c7eace64742c7a934429855a"

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
