class CodexAccount < Formula
  desc "Switch between multiple local Codex sign-ins without revoking them"
  homepage "https://github.com/frndchagas/codex-account"
  url "https://github.com/frndchagas/codex-account/archive/refs/tags/v0.3.2.tar.gz"
  sha256 "53a9519fa76b8594e75387e26ccf7668f837b0de44a9df66dbc6a463ce8c2cf6"
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
