#!/usr/bin/env bash

set -euo pipefail

readonly TEMPLATE_RE='^[a-z0-9]+([.-][a-z0-9]+)*$'
readonly TEMPLATES=(
    bun c-cpp clojure csharp cue deno dhall elixir elm empty gleam go hashi
    haskell haxe java jupyter kotlin latex lean4 nickel nim nix node ocaml odin
    opa php platformio presenterm powershell protobuf pulumi purescript python r
    ruby rust scala shell swi-prolog swift typst vlang zig
)

usage() {
    printf 'Usage: %s TEMPLATE [DESTINATION]\n' "${0##*/}" >&2
    printf 'Example: %s rust ./my-rust-project\n' "${0##*/}" >&2
}

if [[ $# -eq 0 ]]; then
    printf 'Available templates:\n'
    printf '  %s\n' "${TEMPLATES[@]}"
    exit 0
fi

if [[ $# -gt 2 ]]; then
    usage
    exit 2
fi

template=$1
destination=${2:-.}

if [[ ! $template =~ $TEMPLATE_RE ]]; then
    printf 'Error: invalid template name: %s\n' "$template" >&2
    exit 2
fi

if ! command -v nix >/dev/null 2>&1; then
    printf 'Error: nix is not installed or is not in PATH.\n' >&2
    exit 127
fi

mkdir -p -- "$destination"
cd -- "$destination"

printf 'Initializing the %s development flake in %s...\n' "$template" "$PWD"
nix flake init -t "github:the-nix-way/dev-templates#$template"