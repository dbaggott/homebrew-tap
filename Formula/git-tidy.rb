class GitTidy < Formula
  desc "Clean up git worktrees, stale branches, and pack objects"
  homepage "https://github.com/dbaggott/git-tidy"
  url "https://github.com/dbaggott/git-tidy/archive/refs/tags/v0.1.3.tar.gz"
  sha256 "e1c3518dcece005c4deb834346c827cb7a6308c88dea0cb1230bd9c4b34f4706"
  version "0.1.3"
  license "MIT"

  def install
    bin.install "git-tidy"
  end

  test do
    assert_match "git-tidy 0.1.3", shell_output("#{bin}/git-tidy --version")
  end
end
