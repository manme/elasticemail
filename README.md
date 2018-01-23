# ElasticEmail

Basic Elixir wrapper for [ElasticEmail API](https://elasticemail.com/)

Right now wrapper supports only Email functions.</br>
Be free to extend this list.

Official [API Documentation](https://api.elasticemail.com/public/help)

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


Send Email

```elixir
 ElasticEmail.Email.send([to: "user@email.com", subject: "Test from Elixir", bodyHtml: "<b>Some html text here</b>", from: "admin@email.com"])
 ```

 Returns

 ```elixir
 {:ok,
  %{messageid: "_oPCSHFxxx",
    transactionid: "440dx-e81b-8144-e07b-xxx"}}
 ```

Get Email status

```elixir
ElasticEmail.Email.getstatus([transactionID: "xxx"])
```

Returns

```elixir
{:ok,
 %{date: "2018-01-23T21:46:34", dateclicked: nil,
   dateopened: "2018-01-23T21:46:52", datesent: "2018-01-23T21:46:49",
   errormessage: "", from: "admin@email.com", status: 6,
   statuschangedate: "2018-01-23T21:46:55", statusname: "Opened",
   to: "user@email.com",
   transactionid: "440dx-e81b-8144-e07b-xxx"}}
```

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/manme/elasticemail. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.

## Documentation

Documentation can be generated with [ExDoc](https://github.com/elixir-lang/ex_doc)
and published on [HexDocs](https://hexdocs.pm). Once published, the docs can
be found at [https://hexdocs.pm/elasticemail](https://hexdocs.pm/elasticemail).
