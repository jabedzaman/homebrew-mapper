# homebrew-mapper

Homebrew tap for [Mapper](https://github.com/jabedzaman/mapper), a menu bar SSH tunnel manager.

```
brew tap jabedzaman/mapper
brew install --cask mapper
```

Mapper is ad-hoc signed (no Apple Developer ID), so the cask strips the
Gatekeeper quarantine flag on install. This is safe for builds you trust
from this repo's own release pipeline, but be aware it bypasses the usual
"unidentified developer" prompt.
