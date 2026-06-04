class GitTidy < Formula
  desc "Clean up git worktrees, stale branches, and pack objects"
  homepage "https://github.com/dbaggott/git-tidy"
  url "https://github.com/dbaggott/git-tidy/archive/refs/tags/v0.2.0.tar.gz"
  sha256 "c8bf5dce2622e019625ff7060721b3a5096d99b9bc3fca7b5f298ea9250e8c4e"
  license "MIT"

  def install
    bin.install "git-tidy"
  end

  test do
    assert_match "git-tidy 0.2.0", shell_output("#{bin}/git-tidy --version")
  end
end
