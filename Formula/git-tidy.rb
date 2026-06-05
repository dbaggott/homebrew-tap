class GitTidy < Formula
  desc "Clean up git worktrees, stale branches, and pack objects"
  homepage "https://github.com/dbaggott/git-tidy"
  url "https://github.com/dbaggott/git-tidy/archive/refs/tags/v1.2.2.tar.gz"
  sha256 "a7ec0f9e3c56312830c00046664133d8220f978616477bc4bbbd04d517636faa"
  license "MIT"

  def install
    bin.install "git-tidy"
  end

  test do
    assert_match "git-tidy 1.2.2", shell_output("#{bin}/git-tidy --version")
  end
end
