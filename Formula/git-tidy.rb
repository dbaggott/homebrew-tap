class GitTidy < Formula
  desc "Clean up git worktrees, stale branches, and pack objects"
  homepage "https://github.com/dbaggott/git-tidy"
  url "https://github.com/dbaggott/git-tidy/archive/refs/tags/v1.0.0.tar.gz"
  sha256 "6df82bfcd5610f4419c6eea16546689b98b05425976df74a5f03ce933cd83c80"
  license "MIT"

  def install
    bin.install "git-tidy"
  end

  test do
    assert_match "git-tidy 1.0.0", shell_output("#{bin}/git-tidy --version")
  end
end
