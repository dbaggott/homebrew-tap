class GitTidy < Formula
  desc "Clean up git worktrees, stale branches, and pack objects"
  homepage "https://github.com/dbaggott/git-tidy"
  url "https://github.com/dbaggott/git-tidy/archive/refs/tags/v1.3.0.tar.gz"
  sha256 "b1221c2d6d1101922f60a791badc9b82f7c3715b79e99e2051ccc6eea9ea0e04"
  license "MIT"

  def install
    bin.install "git-tidy"
  end

  test do
    assert_match "git-tidy 1.3.0", shell_output("#{bin}/git-tidy --version")
  end
end
