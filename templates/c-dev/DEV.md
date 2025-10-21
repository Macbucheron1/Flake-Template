# Dev Workflow

## First setup

### 1. Update `flake.nix`

Change the value of _name_, _description_ and _version_.

### 2. Update `CMakeLists.txt`

Change the value of `project(<project_name>)`. 

### 3. Open correctly VS-Code 

> [!WARNING]
> The goal here is to setup the linting correctly in VS-Code.
> Make sur you have the clangd extension. 

1. Place yourself at the `flake.nix` level
2. Use `nix develop` to open a nix shell
3. Use `code .` to open VS-Code

The linting should work correctly

## Development Workflow 

### 0. Make sur you are correclty set

To do this see [First setup](./DEV.md#first-setup).
### 1. Make your change in `src/` 

Make some change in the files.
If you add files, make sure they are included at compilation by adding them in the [CMakeLists.txt](./CMakeLists.txt).
Also make to track them with git using `git add`. Otherwise those files won't be seen by nix when you will use `nix build`

### 2. Compile with CMake

```bash
cmake -B build -S .
cmake --build build
```
The result will be placed in `bin/`

### 3. Compile with nix

```bash
nix build
```
The result will be placed in `result/bin/`