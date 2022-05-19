---
sidebar_position: 2
---

<!-- Links -->

[sift]: https://github.com/csqrl/sift
[sift/releases]: https://github.com/csqrl/sift/releases
[sift/wally]: https://wally.run/package/csqrl/sift
[sift/roblox]: https://www.roblox.com/library/9486684823
[sift/itch.io]: https://csqrl.itch.io/sift
[sift/npm]: https://npmjs.com/package/@rbxts/sift

Sift is available from [Wally][sift/wally], [Itch.io][sift/itch.io], the [Roblox Library][sift/roblox], and [GitHub releases][sift/releases].

While Sift is 100% free and open source, if you feel like sponsoring, Sift is also available on [Itch.io][sift/itch.io].

### Wally

Wally is a CLI package manager (much like NPM, Yarn or Cargo) for Roblox by @UpliftGames. Find out more at https://github.com/upliftgames/wally.

```toml
# wally.toml

[dependencies]
Sift = "csqrl/sift@=0.0.1"
```

```shell
$ wally install
```

### TypeScript

v0.0.1 of Sift includes TypeScript definitions. This means Sift is now compatible with roblox-ts. Refer to the Luau docs for API details.

```shell
$ npm install @rbxts/sift
```

[View on NPM &rarr;][sift/npm]

```ts
// example.ts
import Sift from "@rbxts/sift"

Sift.Dictionary.merge({ a: 1, c: 2 }, { b: 3, c: Sift.None }) // { a: 1, b: 3 }
```

Alternatively, you can use tree-shaking to access the modules directly.

```ts
// example.ts
import { Dictionary, None } from "@rbxts/sift"

Dictionary.merge({ a: 1, c: 2 }, { b: 3, c: None }) // { a: 1, b: 3 }
```

### Manual Installation

Grab a copy [from the Roblox Library][sift/roblox] or [GitHub releases][sift/releases], and drop it into Studio. The Sift model file can be synced in using Rojo.
