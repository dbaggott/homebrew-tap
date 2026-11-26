class Macelium < Formula
  desc "Set up a Mac from a state repo and keep it there"
  homepage "https://github.com/dbaggott/macelium"
  version "0.11.0"
  license "MIT"

  depends_on :macos
  depends_on "chezmoi"
  depends_on "gh"
  depends_on "gitleaks"
  depends_on "mise"

  on_arm do
    url "https://github.com/dbaggott/macelium/releases/download/v0.11.0/macelium_darwin_arm64.tar.gz"
    sha256 "cebc7c6c01d5e25342bb5a54b3fdbd1c2bd3ef1fd75be1ef9a7a074e9b66841d"
  end
  on_intel do
    url "https://github.com/dbaggott/macelium/releases/download/v0.11.0/macelium_darwin_amd64.tar.gz"
    sha256 "64a0fcf44f916db99ec0935d4f674d6b8aec188569729437da540513defe518e"
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
    assert_match "macelium 0.11.0", shell_output("#{bin}/macelium --version")
  end
end
