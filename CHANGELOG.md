# Changelog

## [0.0.3]

### Changed

- If `update` is called with a key that doesn't exist in the specified dictionary, the key's value is **set to the key itself**. Fix by [@reselim](https://github.com/Reselim) in [PR #7](https://github.com/csqrl/sift/pull/7).
- Added `aftman.toml` and switched GitHub workflows over to use aftman.

## [0.0.2]

### Changed

- Fixed a bug where `Array.concat(Deep)`, `Dictionary.merge(Deep)` and `Set.merge` would not accept holes (`nil` values) in their arguments. This would cause the function to stop processing further arguments once it found a `nil` value.
- Fixed a bug where `Array.insert` would not insert the element at the correct index. An index of `0` will now insert the element at the end of the array. `length+1` will also insert the element at the end of the array. `length+2` (or greater) will be ignored, and the original array will be returned.
- Bumped tooling versions:
  - rojo to v7.1.1
  - stylua to v0.13.1
  - selene to v0.17.0

## [0.0.1]

### Added

- Basic **TypeScript (roblox-ts) support** (no tsdoc yet)! 🎉
- Implemented `isEmpty`
- Added typings to `equalObjects`
- Added aliases for `Array.concat`, `Array.concatDeep`, `Array.push`, `Array.unshift`, `Array.find`, `Array.includes`, `Dictionary.join`, `Dictionary.joinDeep`, `Set.fromArray`, `Set.merge`, `Set.delete`
- Added doc pages for installation and usage samples

### Changed

- Exposed `isEmpty` and `equalObjects` from the root module
- Improved typings for methods accepting predictes
- Updated documentation for some methods
- Fixed `Dictionary.flatten` being shown in the `Array` docs (wrong `@within` tag)

## [0.0.0]

Initial development version.
