class Macelium < Formula
  desc "Set up a Mac from a state repo and keep it there"
  homepage "https://github.com/dbaggott/macelium"
  url "https://github.com/dbaggott/macelium/archive/refs/tags/v0.9.0.tar.gz"
  sha256 "f697f42b2f9fc35fefaf569d5e5ea456be5431e6e3f40ce5f2c520b34783b7b3"
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
    assert_match "macelium 0.9.0", shell_output("#{bin}/macelium --version")
  end
end
