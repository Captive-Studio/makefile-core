# Makefile core module _(@captive/makefile-core)_

[![License][license-image]][license-url]

> Core functions for makefiles (module management, help)

## Getting Started

Makefile technology has some drawbacks but it is reliable, language agnostic and available by default on most platform.
This project aims to standardize most common functionalities. Simply copy and include `core.mk` in your project and start building your project !

## Features

- 📦 Simple dependency manager (using git submodule)
  - ✓ No extra dependency
  - ✓ Lightweight implementation
  - ✓ Compatible dependency maintainer bot (Renovate)
- ℹ️ Automatic help generator, based on comments
- ⚒️ Everything is customizable using `Makefile.local`

## Usage

### Installer (Recommended)

```console
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Captive-Studio/makefile-core/main/install.sh)"
```

### Manual (Alternate)

**1. Copy `core.mk` to your project**

```shell
my-project/
├─ makefiles/
│  ├─ core.mk <- COPY https://raw.githubusercontent.com/Captive-Studio/makefile-core/main/core.mk
├─ Makefile
```

**2. Include `makefiles/core.mk` in your `Makefile`**

```makefile
# At the start of Makefile

include makefiles/core.mk
```

**3. Test that everything is working**

```console
> make help

```

## Documentation

### `make help`

Display all available targets and flags

To document a target, add a comment starting with `##`

```makefile
## Do something
my_target:
```

Will display

```console
> make help

...
Targets :
...
    my_target       Do something
...
```

### `make self-add`

Add a makefile module (as git submodule)

Example :

```console
> make self-add url=https://github.com/ianstormtaylor/makefile-assert
# It will add /makefiles/makefile-assert git submodule
```

### `make self-update`

Update all makefile modules

Example :

```console
> make self-update
```

### `Makefile.local`

Override any behavior by creating `Makefile.local`

```shell
my-project/
├─ makefiles/
│  ├─ ...
├─ Makefile
├─ Makefile.local <- Will override
```

## Contributing

TODO

## Acknowledgement

These repository were inspirations to build makefile-core :

- <https://github.com/ianstormtaylor/makefile-help>
- <https://github.com/tmatis/42make>

## License
<!-- AUTO-GENERATED-CONTENT:START (PKG_JSON:template=[${license}][license-url] © ${author}) -->
[MIT][license-url] © Captive Studio
<!-- AUTO-GENERATED-CONTENT:END -->

<!-- VARIABLES -->

<!-- AUTO-GENERATED-CONTENT:START (PKG_JSON:template=[package-version-svg]: https://img.shields.io/npm/v/${name}.svg?style=flat-square) -->
<!-- AUTO-GENERATED-CONTENT:END -->
<!-- AUTO-GENERATED-CONTENT:START (PKG_JSON:template=[package-url]: https://www.npmjs.com/package/${name}) -->
<!-- AUTO-GENERATED-CONTENT:END -->
<!-- AUTO-GENERATED-CONTENT:START (PKG_JSON:template=[license-image]: https://img.shields.io/badge/license-${license}-green.svg?style=flat-square) -->
[license-image]: https://img.shields.io/badge/license-MIT-green.svg?style=flat-square
<!-- AUTO-GENERATED-CONTENT:END -->
[license-url]: ./LICENSE
