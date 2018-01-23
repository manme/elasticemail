# ElasticEmail

Basic Elixir wrapper for [ElasticEmail API](https://elasticemail.com/)

Right now wrapper supports only Email functions.</br>
Be free to add new functions.

## Installation

If [available in Hex](https://hex.pm/docs/publish), the package can be installed
by adding `elasticemail` to your list of dependencies in `mix.exs`:

```elixir
def deps do
  [
    {:elasticemail, "~> 0.1.0"}
  ]
end
```

## Configuration

## Usage

Define API key

```elixir
Application.put_env(:elasticemail, :api_key, "your apikey")
```

Call Email function with arguments

```elixir
ElasticEmail.Email.getstatus([transactionID: "xxx"])
```

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/manme/elasticemail. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.

## Documentation

Documentation can be generated with [ExDoc](https://github.com/elixir-lang/ex_doc)
and published on [HexDocs](https://hexdocs.pm). Once published, the docs can
be found at [https://hexdocs.pm/elasticemail](https://hexdocs.pm/elasticemail).
