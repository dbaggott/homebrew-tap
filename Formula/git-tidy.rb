class GitTidy < Formula
  desc "Clean up git worktrees, stale branches, and pack objects"
  homepage "https://github.com/dbaggott/git-tidy"
  url "https://github.com/dbaggott/git-tidy/archive/refs/tags/v1.4.0.tar.gz"
  sha256 "0cca631f01128f04cf4fda712dcfe3bf1458c2f8609189daa8ea031d66f4c235"
  license "MIT"

  def install
    bin.install "git-tidy"
  end

  test do
    assert_match "git-tidy 1.4.0", shell_output("#{bin}/git-tidy --version")
  end
end
