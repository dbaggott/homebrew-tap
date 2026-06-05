class GitTidy < Formula
  desc "Clean up git worktrees, stale branches, and pack objects"
  homepage "https://github.com/dbaggott/git-tidy"
  url "https://github.com/dbaggott/git-tidy/archive/refs/tags/v1.2.0.tar.gz"
  sha256 "619f751c689b2c35632a4201847b7798ab61b7da3d0755c6d8a5d7256de1cebd"
  license "MIT"

  def install
    bin.install "git-tidy"
  end

  test do
    assert_match "git-tidy 1.2.0", shell_output("#{bin}/git-tidy --version")
  end
end
