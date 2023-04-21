# node v20, binary example

Example of a node program converted from typescript into a single binary.

This example imports from a local folder as well as from a npm package on purpose
to show both use cases are working.

> The `Dockerfile` is the most explanatory file in this repository.

## Usage

```bash
make build
docker run --rm node20bin:latest
```

## Important
Entire application should be contained in a single .js file.
This can be done using `@vercel/ncc`, `webpack` or other build tools.

When using alpine based images, make sure to install `libstdc++`, because
the node binary requires these libs to be installed.
