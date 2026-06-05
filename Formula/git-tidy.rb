class GitTidy < Formula
  desc "Clean up git worktrees, stale branches, and pack objects"
  homepage "https://github.com/dbaggott/git-tidy"
  url "https://github.com/dbaggott/git-tidy/archive/refs/tags/v1.1.0.tar.gz"
  sha256 "93385e5c2afc66ebccf95988801399658c015d31cdd68f74d33888f7534deff6"
  license "MIT"

  def install
    bin.install "git-tidy"
  end

  test do
    assert_match "git-tidy 1.1.0", shell_output("#{bin}/git-tidy --version")
  end
end
