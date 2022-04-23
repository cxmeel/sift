<!-- Links -->

[freddylist/llama]: https://github.com/freddylist/llama
[osyrisrblx/t]: https://github.com/osyrisrblx/t
[upliftgames/moonwave]: https://github.com/upliftgames/moonwave
[roblox-ts]: https://roblox-ts.com

# Sift

Immutable data manipulation for Luau.

Heavily based on [@freddylist's Llama][freddylist/llama] library, which is no longer maintained.

## What's Changed?

As per the recommendations in [Llama's README][freddylist/llama], the following changes have been made:

- Sift utilises native Luau types. Llama used [@osyrisrblx/t][osyrisrblx/t] for type checking, which meant that types were only checked at runtime.
  - Sift _will not_ check types at runtime. If you're using the library wrong, you'll get errors at runtime anyway!
- Organised tests. `*.spec` files are now alongside their source files, making it easier to locate them.
- Documentation is now generated using [@upliftgames' moonwave][upliftgames/moonwave] (Docusaurus). This makes it quick and easy to add new documentation, and provides a pleasant experience for the user.
- TypeScript support. Sift is written in Luau, but includes a TypeScript declaration file to make Sift compatible with [roblox-ts][roblox-ts].
