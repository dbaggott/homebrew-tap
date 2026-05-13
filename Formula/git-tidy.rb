class GitTidy < Formula
  desc "Clean up git worktrees, stale branches, and pack objects"
  homepage "https://github.com/dbaggott/git-tidy"
  url "https://github.com/dbaggott/git-tidy/archive/refs/tags/v0.1.1.tar.gz"
  sha256 "3d5f264a33fc10d5fd28de46114be9d13359b86b97a46d72d19c7f10c1961db2"
  version "0.1.1"
  license "MIT"

  depends_on "bash"

  def install
    bin.install "git-tidy"
  end

  test do
    assert_match "git-tidy 0.1.1", shell_output("#{bin}/git-tidy --version")
  end
end
