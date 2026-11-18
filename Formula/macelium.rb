class Macelium < Formula
  desc "Set up a Mac from a state repo and keep it there"
  homepage "https://github.com/dbaggott/macelium"
  url "https://github.com/dbaggott/macelium/archive/refs/tags/v0.7.1.tar.gz"
  sha256 "8bfab2bcd303c6e1ed16dcce84ac819c7a3c9f6eacd2327e4b3022ff26b35a11"
  license "MIT"

  depends_on "chezmoi"
  depends_on "gh"
  depends_on "jq"
  depends_on "mise"

  def install
    bin.install "macelium"
    bash_completion.install "completions/macelium.bash" => "macelium"
    zsh_completion.install "completions/_macelium"
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
    assert_match "macelium 0.7.1", shell_output("#{bin}/macelium --version")
  end
end
