class Macelium < Formula
  desc "Set up a Mac from a state repo and keep it there"
  homepage "https://github.com/dbaggott/macelium"
  version "0.11.1"
  license "MIT"

  depends_on :macos
  depends_on "chezmoi"
  depends_on "gh"
  depends_on "gitleaks"
  depends_on "mise"

  on_arm do
    url "https://github.com/dbaggott/macelium/releases/download/v0.11.1/macelium_darwin_arm64.tar.gz"
    sha256 "45ff263ec0550f234706c263eb0d2ad5119519c6f43204cbb204913e8d1fa16e"
  end
  on_intel do
    url "https://github.com/dbaggott/macelium/releases/download/v0.11.1/macelium_darwin_amd64.tar.gz"
    sha256 "6cdaded58c58f34dd6830aad91a2f34083a7b20f1f36e9f87cea6d1f4a643a1c"
  end

  def install
    bin.install "macelium"
    generate_completions_from_executable(bin/"macelium", "completion")
  end

  service do
    run [opt_bin/"macelium", "plan", "--notify"]
    run_type :cron
    cron "0 9 * * *"
    run_at_load false
    environment_variables PATH: std_service_path_env
    log_path "#{Dir.home}/Library/Logs/macelium-drift.log"
    error_log_path "#{Dir.home}/Library/Logs/macelium-drift.log"
  end

  test do
    assert_match "macelium 0.11.1", shell_output("#{bin}/macelium --version")
  end
end
