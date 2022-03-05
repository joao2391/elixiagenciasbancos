[![Elixbacen version](https://img.shields.io/hexpm/v/elixagenciasbancos.svg)](https://hex.pm/packages/elixagenciasbancos)
[![Hex Docs](https://img.shields.io/badge/hex-docs-lightgreen.svg)](https://hexdocs.pm/elixagenciasbancos/)
[![Hex.pm](https://img.shields.io/hexpm/dt/elixagenciasbancos.svg)](https://hex.pm/packages/)
# Elixagenciasbancos

Elixagenciasbancos helps you to get brazilian's bank agencies.

## Notes
Version 0.1.0:

- Added features to get brazilian's bank agencies.

## Installation

If [available in Hex](https://hex.pm/docs/publish), the package can be installed
by adding `elixagenciasbancos` to your list of dependencies in `mix.exs`:

```elixir
def deps do
  [
    {:elixagenciasbancos, "~> 0.1.0"}
  ]
end
```

## Features
```elixir
get_agencias_by_cep("cep", 1)

get_agencias_by_municipio("nome_municipio", 1)

get_agencias_by_municipio_e_nome_banco("nome_municipio", "nome_banco", 1)


```

## Documentation

Documentation can be found at [https://hexdocs.pm/elixagenciasbancos](https://hexdocs.pm/elixagenciasbancos).

## License
[MIT](https://choosealicense.com/licenses/mit/)

