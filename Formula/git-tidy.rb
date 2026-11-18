class GitTidy < Formula
  desc "Clean up git worktrees, stale branches, and pack objects"
  homepage "https://github.com/dbaggott/git-tidy"
  url "https://github.com/dbaggott/git-tidy/archive/refs/tags/v1.5.0.tar.gz"
  sha256 "0bb3697a8079bbae2cc2513e0df26a611576b70db5c03c3308d187b6814733d1"
  license "MIT"

  def install
    bin.install "git-tidy"
  end

  test do
    assert_match "git-tidy 1.5.0", shell_output("#{bin}/git-tidy --version")
  end
end
