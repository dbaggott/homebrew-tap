class Macelium < Formula
  desc "Set up a Mac from a state repo and keep it there"
  homepage "https://github.com/dbaggott/macelium"
  url "https://github.com/dbaggott/macelium/archive/refs/tags/v0.3.1.tar.gz"
  sha256 "cc84522816c2b63a5199f5fb9b50ae993bfcc49c8a7d19da78f576b5d7adec4e"
  license "MIT"

  depends_on "chezmoi"
  depends_on "gh"
  depends_on "jq"
  depends_on "mise"

  def install
    bin.install "macelium"
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
    assert_match "macelium 0.3.1", shell_output("#{bin}/macelium --version")
  end
end
