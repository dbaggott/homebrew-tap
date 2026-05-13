class GitTidy < Formula
  desc "Clean up git worktrees, stale branches, and pack objects"
  homepage "https://github.com/dbaggott/git-tidy"
  url "https://github.com/dbaggott/git-tidy/archive/refs/tags/v0.1.2.tar.gz"
  sha256 "f9b6c100ab0346f6bef7b75c56569921057e0bd08e9c1f5beba0899e4f7000c3"
  version "0.1.2"
  license "MIT"

  depends_on "bash"

  def install
    bin.install "git-tidy"
  end

  test do
    assert_match "git-tidy 0.1.2", shell_output("#{bin}/git-tidy --version")
  end
end
