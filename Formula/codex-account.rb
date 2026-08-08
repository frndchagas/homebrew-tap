class CodexAccount < Formula
  desc "Switch between multiple local Codex sign-ins without revoking them"
  homepage "https://github.com/frndchagas/codex-account"
  url "https://github.com/frndchagas/codex-account/archive/refs/tags/v0.3.0.tar.gz"
  sha256 "4c9d58e222df9d1e329e5e490b0f1586553aedc626188995ed4b6a264a54347a"
  license "MIT"
  head "https://github.com/frndchagas/codex-account.git", branch: "main"

  def install
    system "make", "install", "PREFIX=#{prefix}"
  end

  test do
    assert_match "codex-account #{version}", shell_output("#{bin}/codex-account version")

    # No profiles, no active credential: the tool should say so and not invent one.
    ENV["CODEX_HOME"] = testpath/"codex"
    ENV["CODEX_ACCOUNT_HOME"] = testpath/"data"
    assert_match "No profiles saved yet", shell_output("#{bin}/codex-account list")
    assert_match "Not signed in", shell_output("#{bin}/codex-account current", 1)
  end
end
