class GitTidy < Formula
  desc "Clean up git worktrees, stale branches, and pack objects"
  homepage "https://github.com/dbaggott/git-tidy"
  url "https://github.com/dbaggott/git-tidy/archive/refs/tags/v1.1.1.tar.gz"
  sha256 "108fe404444d40e789417dc84da74744514b298102eb2e33b3e626fb9b73b6e4"
  license "MIT"

  def install
    bin.install "git-tidy"
  end

  test do
    assert_match "git-tidy 1.1.1", shell_output("#{bin}/git-tidy --version")
  end
end
