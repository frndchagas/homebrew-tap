# frndchagas/homebrew-tap

Homebrew formulae for my tools.

```sh
brew tap frndchagas/tap
```

## Formulae

### codex-account

Switch between multiple local Codex sign-ins without revoking them.

```sh
brew install frndchagas/tap/codex-account
```

Signing out through the Codex app revokes the tokens server-side, which also
kills the browser session you would otherwise reuse to sign back in.
[codex-account](https://github.com/frndchagas/codex-account) never revokes
anything: it only moves `~/.codex/auth.json` around.

## License

The formulae here are MIT-licensed. Each tool carries its own license.
