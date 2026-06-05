class GitTidy < Formula
  desc "Clean up git worktrees, stale branches, and pack objects"
  homepage "https://github.com/dbaggott/git-tidy"
  url "https://github.com/dbaggott/git-tidy/archive/refs/tags/v1.2.1.tar.gz"
  sha256 "4df396838967424f6dc725ad831aaf2993d7ac8e02e583514261156399330a1a"
  license "MIT"

  def install
    bin.install "git-tidy"
  end

  test do
    assert_match "git-tidy 1.2.1", shell_output("#{bin}/git-tidy --version")
  end
end
