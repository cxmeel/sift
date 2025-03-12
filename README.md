<!-- Links -->

[freddylist/llama]: https://github.com/freddylist/llama
[osyrisrblx/t]: https://github.com/osyrisrblx/t
[upliftgames/moonwave]: https://github.com/upliftgames/moonwave
[upliftgames/wally]: https://github.com/upliftgames/wally
[sift]: https://github.com/cxmeel/sift
[sift/releases]: https://github.com/cxmeel/sift/releases
[sift/wally]: https://wally.run/package/csqrl/sift
[sift/roblox]: https://www.roblox.com/library/9486684823
[sift/npm]: https://npmjs.com/package/@rbxts/sift
[sift/docs]: https://cxmeel.github.io/sift

<!-- Badges -->

[badges/github]: https://raw.githubusercontent.com/gist/cxmeel/56c5f18b229ca1e61feb6eb5fb149f43/raw/githubSource.svg
[badges/npm]: https://raw.githubusercontent.com/gist/cxmeel/56c5f18b229ca1e61feb6eb5fb149f43/raw/npm.svg
[badges/roblox]: https://raw.githubusercontent.com/gist/cxmeel/56c5f18b229ca1e61feb6eb5fb149f43/raw/roblox.svg
[badges/roblox-small]: https://raw.githubusercontent.com/gist/cxmeel/56c5f18b229ca1e61feb6eb5fb149f43/raw/robloxSmall.svg

# Sift

<div align="center">

[![Source code][badges/github]][sift] [![NPM Package][badges/npm]][sift/npm] [![Roblox library][badges/roblox]][sift/roblox]

</div>

Immutable data library for Luau and roblox-ts.

Heavily based on [@freddylist's Llama][freddylist/llama] library, which is no longer maintained.

[Read the docs &rarr;][sift/docs]

## Quick Start

Sift is available from [Wally][sift/wally], the [Roblox Creator Store][sift/roblox] and [GitHub releases][sift/releases].

### Wally

Wally is a CLI package manager (much like NPM, Yarn or Cargo) for Roblox by @UpliftGames. Find out more at https://github.com/upliftgames/wally.

```toml
# wally.toml

[dependencies]
Sift = "csqrl/sift@x.x.x" # Replace with current version number
```

```shell
$ wally install
```

### TypeScript

Sift includes built-in TypeScript compatibility. The API is identical to the Luau counterpart.

```shell
$ npm install @rbxts/sift
```

```ts
// example.ts
import { Dictionary } from "@rbxts/sift"

Dictionary.merge({ a: 1, c: 2 }, { b: 3, c: Sift.None }) // { a: 1, b: 3 }
```

### Manual Installation

Grab a copy [from the Roblox Creator Store][sift/roblox] or [GitHub releases][sift/releases], and drop it into Studio. The Sift model file can be synced in using Rojo.

## Contributions

Sift is not open for contributions and is not actively maintained. If you would like to contribute, please consider creating a fork.

## What's Changed?

As per the recommendations in [Llama's README][freddylist/llama], the following changes have been made:

- Sift utilises native Luau types. Llama used [@osyrisrblx/t][osyrisrblx/t] for type checking, which meant that types were only checked at runtime. **Sift does not use runtime type-checking.** You will need to install a library like [GreenTea](https://github.com/Corecii/GreenTea) or [t][osyrisrblx/t] manually.
- Organised tests. `*.spec` files are now alongside their source files, making it easier to locate them.
- Documentation is now generated using [@upliftgames' moonwave][upliftgames/moonwave] (Docusaurus). This makes it quick and easy to add new documentation, and provides a pleasant experience for the user.
- Built-in TypeScript typings.
