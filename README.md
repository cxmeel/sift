<!-- Links -->

[upliftgames/moonwave]: https://github.com/upliftgames/moonwave
[sift]: https://github.com/cxmeel/sift
[sift/releases]: https://github.com/cxmeel/sift/releases
[sift/wally]: https://wally.run/package/cxmeel/sift
[sift/roblox]: https://create.roblox.com/store/asset/9486684823/Sift
[sift/npm]: https://npmjs.com/package/@rbxts/sift

<!-- Shields -->

[shields/github-release]: https://img.shields.io/github/v/release/cxmeel/sift?label=latest+release&style=flat
[shields/wally]: https://img.shields.io/endpoint?url=https://runkit.io/clockworksquirrel/wally-version-shield/branches/master/csqrl/sift&color=blue&label=wally&style=flat
[shields/npm]: https://img.shields.io/npm/v/@rbxts/sift?style=flat

<!-- Badges -->

[badges/github]: https://gist.github.com/cxmeel/0dbc95191f239b631c3874f4ccf114e2/raw/github_source.svg
[badges/npm]: https://gist.github.com/cxmeel/0dbc95191f239b631c3874f4ccf114e2/raw/npm.svg
[badges/roblox]: https://gist.github.com/cxmeel/0dbc95191f239b631c3874f4ccf114e2/raw/roblox_dev.svg

# Sift

<!-- markdownlint-disable-next-line MD033 -->
<div align="center">

[![Source code][badges/github]][sift] [![NPM Package][badges/npm]][sift/npm] [![Roblox Creator Store][badges/roblox]][sift/roblox]

[![Latest GitHub version][shields/github-release]][sift/releases] [![Latest Wally version][shields/wally]][sift/wally] [![Latest NPM version][shields/npm]][sift/npm]

</div>

Immutable data library for Luau, Roblox and roblox-ts.

## Documentation

Documentation, powered by [moonwave][upliftgames/moonwave], is available at <https://cxmeel.github.io/sift>.

## v0.x

For the time being, releases will remain at v0.x, and Sift should not be considered 100% stable. This is in line with the [Semantic Versioning 2.0.0](https://semver.org) specification.

- Breaking changes may occur when the minor version is incremented.
- The patch version will be incremented for additions, non-breaking changes, and bug fixes.

This will remain the same until v1.x.

## Quick Start

Sift is available from [Wally][sift/wally], the [Roblox Creator Store][sift/roblox] and [GitHub releases][sift/releases].

### Wally

Wally is a CLI package manager (much like NPM, Yarn or Cargo) for Roblox by @UpliftGames. Find out more at <https://github.com/upliftgames/wally>.

```toml
# wally.toml

[dependencies]
Sift = "csqrl/sift@X.X.X" # Replace with current version number
```

```sh
wally install
```

### TypeScript

v0.0.1 of Sift includes TypeScript typings. This means Sift is now compatible with roblox-ts. Refer to the Luau docs for API details.

```sh
npm install @rbxts/sift
```

```ts
// example.ts
import { None, Dictionary } from "@rbxts/sift"

Dictionary.merge(
    { a: 1, c: 2 },
    { b: 3, c: None }
) // { a: 1, b: 3 }
```

### Manual Installation

Grab a copy [from the Roblox Creator Store][sift/roblox] or [GitHub releases][sift/releases], and drop it into Studio. The Sift model file can be synced in using Rojo.
