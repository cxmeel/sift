<!-- Links -->

[freddylist/llama]: https://github.com/freddylist/llama
[osyrisrblx/t]: https://github.com/osyrisrblx/t
[evaera/moonwave]: https://github.com/evaera/moonwave
[upliftgames/wally]: https://github.com/upliftgames/wally
[sift]: https://github.com/cxmeel/sift
[sift/releases]: https://github.com/cxmeel/sift/releases
[sift/wally]: https://wally.run/package/csqrl/sift
[sift/roblox]: https://create.roblox.com/store/asset/9486684823/Sift
[sift/npm]: https://npmjs.com/package/@rbxts/sift
[sift/documentation]: https://cxmeel.github.io/sift

<!-- Shields -->

[shields/github-release]: https://img.shields.io/github/v/release/cxmeel/sift?label=latest+release&style=flat
[shields/wally]: https://img.shields.io/endpoint?url=https://runkit.io/clockworksquirrel/wally-version-shield/branches/master/csqrl/sift&color=blue&label=wally&style=flat
[shields/npm]: https://img.shields.io/npm/v/@rbxts/sift?style=flat

<!-- Badges -->

[badges/github]: https://raw.githubusercontent.com/gist/cxmeel/56c5f18b229ca1e61feb6eb5fb149f43/raw/githubSource.svg
[badges/npm]: https://raw.githubusercontent.com/gist/cxmeel/56c5f18b229ca1e61feb6eb5fb149f43/raw/npm.svg
[badges/roblox]: https://raw.githubusercontent.com/gist/cxmeel/56c5f18b229ca1e61feb6eb5fb149f43/raw/roblox.svg

# Sift

<div align="center">

[![Source code][badges/github]][sift] [![NPM Package][badges/npm]][sift/npm] [![Roblox library][badges/roblox]][sift/roblox]

[![Latest GitHub version][shields/github-release]][sift/releases] [![Latest Wally version][shields/wally]][sift/wally] [![Latest NPM version][shields/npm]][sift/npm]

</div>

Immutable data library for Luau and roblox-ts.

Heavily based on [@freddylist's Llama][freddylist/llama] library, which is no longer maintained.

## Documentation

Documentation, powered by [@evaera's moonwave][evaera/moonwave], is available at [here][sift/documentation].

## v0.x

For the time being, releases will remain at v0.x, and Sift should not be considered 100% stable. This is in line with the [Semantic Versioning 2.0.0](https://semver.org) specification.

- Breaking changes may occur when the minor version is incremented.
- The patch version will be incremented for additions, non-breaking changes, and bug fixes.

This will remain the same until v1.x.

## Quick Start

Sift is available from [Wally][sift/wally], the [Roblox Library][sift/roblox], and [GitHub releases][sift/releases].

While Sift is 100% free and open source, if you feel like sponsoring, you can support us on [GitHub Sponsors](https://github.com/sponsors/cxmeel).

### Wally

Wally is a CLI package manager (much like NPM, Yarn or Cargo) for Roblox by @UpliftGames. Find out more at [here][upliftgames/wally].

```toml
# wally.toml

[dependencies]
Sift = "csqrl/sift@0.0.X" # Replace with latest version number
```

```shell
wally install
```

### TypeScript

v0.0.1 of Sift includes TypeScript typings. This means Sift is now compatible with roblox-ts. Refer to the Luau docs for API details.

```shell
npm install @rbxts/sift
```

```ts
// example.ts
import Sift from "@rbxts/sift"

Sift.Dictionary.merge({ a: 1, c: 2 }, { b: 3, c: Sift.None }) // { a: 1, b: 3 }
```

### Manual Installation

Grab a copy [from the Roblox Library][sift/roblox] or [GitHub releases][sift/releases], and drop it into Studio. The Sift model file can be synced in using Rojo.

## What's Changed?

As per the recommendations in [Llama's README][freddylist/llama], the following changes have been made:

- Sift utilizes native Luau types. Llama used [@osyrisrblx/t][osyrisrblx/t] for type checking, which meant that types were only checked at runtime.
  - Sift _will not_ check types at runtime. If you're using the library wrong, you'll get errors at runtime anyway!
- Organized tests. `*.spec` files are now alongside their source files, making it easier to locate them.
- Documentation is now generated using [@evaera's moonwave][evaera/moonwave] (Docusaurus). This makes it quick and easy to add new documentation, and provides a pleasant experience for the user.
- Built-in TypeScript typings.

## What's New?

### Arrays (Lists)

- `at`: Get an element at a specific index (negative indices are supported).
- `difference`: Returns an array of values that are in the first array, but not in the other arrays.
- `differenceSymmetric`: Returns an array of values that are in the first array, but not in the other arrays, and vice versa.
- `freeze`: Freeze an array.
- `freezeDeep`: Freeze an array and all nested arrays.
- `is`: Check if the passed value is an array.
- `shuffle`: Shuffle the elements of an array to a random order.

### Dictionaries

- `entries`: Get the entries of a dictionary as an array of key-value pairs.
- `freeze`: Freeze a dictionary.
- `freezeDeep`: Freeze a dictionary and all nested dictionaries.
- `fromEntries`: Create a dictionary from an array of key-value pairs.

### Sets

- `count`: Get the number of elements in a set.
- `difference`: Returns a set of values that are in the first set, but not in the other sets.
- `differenceSymmetric`: Returns a set of values that are in the first set, but not in the other sets, and vice versa.
