# Vic's personal collection of Nix flake templates

Some of them shamelessly stolen from other smarter nix users. Here I just keep a personal repo that
I can change and modify as I need.

## Usage

Replace `<template>` with the name of the template you want to use:

```bash
mkdir project && cd project
nix flake init -t github:vicrdguez/flake-templates#<template>
```
or 

```bash
nix flake new -t github:vicrdguez/flake-templates#<template> ./project
```

If you want to see a list of templates in this repo from the terminal you can do:

```bash
nix flake show github:vicrdguez/flake-templates
```
