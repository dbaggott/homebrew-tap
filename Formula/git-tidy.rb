class GitTidy < Formula
  desc "Clean up git worktrees, stale branches, and pack objects"
  homepage "https://github.com/dbaggott/git-tidy"
  url "https://github.com/dbaggott/git-tidy/archive/refs/tags/v0.3.0.tar.gz"
  sha256 "fed84571dadf5680f3338128509bd27c63475b4f577d70363d7719e0f4e55385"
  license "MIT"

  def install
    bin.install "git-tidy"
  end

  test do
    assert_match "git-tidy 0.3.0", shell_output("#{bin}/git-tidy --version")
  end
end
