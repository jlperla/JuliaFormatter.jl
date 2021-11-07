```@meta
CurrentModule = JuliaFormatter
```

# Configuration File

From v0.4.3, JuliaFormatter offers [`.prettierrc` style](https://prettier.io/docs/en/configuration.html)
configuration file support.
This means you can specify formatting options shown in [`format_text`](@ref) in `.JuliaFormatter.toml` file and share that with others.

When [`format`](@ref) called, it will look for `.JuliaFormatter.toml` in the location of the file being formatted,
and searching _up_ the file tree until a config file is (or isn't) found.
When found, the configurations in the file will overwrite the given options.

!!! note

    [Juno](https://junolab.org/), a Julia IDE that offers formatting feature using this package, also respects
    configuration file.
    When you use `Julia-Client: Format-Code` command, Juno will automatically search for a configuration file with the
    same rule as `format` does from the directory of current editor.

## Basic Configuration

In `.JuliaFormatter.toml`, you can specify any of the formatting options shown in [`format_text`](@ref) in TOML, e.g. if you have

> somedir/.JuliaFormatter.toml

```toml
indent = 2
margin = 100
```

then files under `somedir` will be formatted with 2 spaces indentation and the maximum line length 100.


Rather than the `style = "default"`, to you can use [YAS Style](@ref) with

```toml
style = "yas"
```

Similarly, you can make customizations to a chosen style.  For exmaple to use [Blue Style](@ref) and then customize the margin,

```toml
style = "blue"
margin = 100
```

## Search Rule

`.JuliaFormatter.toml` will be searched _up_ from the directory of the file being formatted.
So if you have:

```
dir
├─ .JuliaFormatter.toml
├─ code.jl
└─ subdir
   └─ sub_code.jl
```

then `format("subdir/sub_code.jl")` will be automatically configured by the `dir/.JuliaFormatter.toml`, as well as
`format("dir")` will format both `dir/code.jl` and `dir/subdir/sub_code.jl` according to the same configuration.

What will happen when we have multiple `.JuliaFormatter.toml` files ? In that case, the _deepest_ configuration has the
precedence. For example, if you have

```
dir
├─ .JuliaFormatter.toml
├─ code.jl
├─ subdir1
│  ├─ .JuliaFormatter.toml
│  └─ sub_code1.jl
└─ subdir2
   └─ sub_code2.jl
```

and call `format("dir")`, `code.jl` and `sub_code2.jl` will be formatted according to the rules defined in
`dir/.JuliaFormatter.toml`, while formatting `sub_code1.jl` will be configured by `dir/subdir1/.JuliaFormatter.toml`.
