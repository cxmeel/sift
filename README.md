<!-- Links -->

[freddylist/llama]: https://github.com/freddylist/llama
[osyrisrblx/t]: https://github.com/osyrisrblx/t
[upliftgames/moonwave]: https://github.com/upliftgames/moonwave

# Sift

Immutable data library for Luau (Roblox).

Heavily based on [@freddylist's Llama][freddylist/llama] library, which is no longer maintained.

## What's Changed?

As per the recommendations in [Llama's README][freddylist/llama], the following changes have been made:

- Sift utilises native Luau types. Llama used [@osyrisrblx/t][osyrisrblx/t] for type checking, which meant that types were only checked at runtime.
  - Sift _will not_ check types at runtime. If you're using the library wrong, you'll get errors at runtime anyway!
- Organised tests. `*.spec` files are now alongside their source files, making it easier to locate them.
- Documentation is now generated using [@upliftgames' moonwave][upliftgames/moonwave] (Docusaurus). This makes it quick and easy to add new documentation, and provides a pleasant experience for the user.

## What's New?

### Arrays (Lists)

- `At`: Get an element at a specific index (negative indices are supported).
- `Freeze`: Freeze an array.
- `FreezeDeep`: Freeze an array and all nested arrays.
- `Shuffle`: Shuffle the elements of an array to a random order.

### Dictionaries

- `Entries`: Get the entries of a dictionary as an array of key-value pairs.
- `Freeze`: Freeze a dictionary.
- `FreezeDeep`: Freeze a dictionary and all nested dictionaries.
- `FromEntries`: Create a dictionary from an array of key-value pairs.
