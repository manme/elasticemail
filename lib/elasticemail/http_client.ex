defmodule ElasticEmail.HTTPClient do
  @moduledoc """
  Poison HTTP Client for ElasticEmail
  """

  use HTTPoison.Base

  alias ElasticEmail.Config

  @doc """
  Send post request to ElasticEmail API
  """
  def post_request(url, params) do
    post(url, "", [], [params: Enum.concat([apikey: Config.api_key!], params)])
    |> response_body
    |> response_content
  end

  @doc """
  Send get request to ElasticEmail API
  """
  def get_request(url, params) do
    get(url, [], [params: Enum.concat([apikey: Config.api_key!], params)])
    |> response_body
    |> response_content
  end

  @doc """
  Extract body from HTTPoison.Response
  """
  def response_body({:ok, response}), do: response.body

  @doc """
  Proccess the body with error from ElasticEmail API
  """
  def response_content(%{success: false, error: error}),
    do: {:error, error}

  @doc """
  Proccess the body with data from ElasticEmail API
  """
  def response_content(%{success: true, data: data}),
    do: {:ok, data}

  @doc """
  Complete / Filter URL
  ### Examples
      iex> Application.put_env(:elasticemail, :api_key, "your apikey")
      iex> Application.delete_env(:elasticemail, :api_version)
      iex> ElasticEmail.HTTPClient.process_url("test")
      "https://api.elasticemail.com/v2/test"
      iex> Application.put_env(:elasticemail, :api_key, "your apikey")
      iex> Application.delete_env(:elasticemail, :api_version)
      iex> ElasticEmail.HTTPClient.process_url("https://api.elasticemail.com/v2/test")
      "https://api.elasticemail.com/v2/test"
  """
  case Mix.env do
    :test ->
      def process_url(url) do
        IO.puts url
        _process_url(url)
      end
    _ ->
      def process_url(url), do: _process_url(url)
  end

  defp _process_url(url) do
    root = Config.root_endpoint!
    cond do
      String.starts_with?(url, root) ->
        url
      String.starts_with?(url, "/") ->
        root <> String.slice(url, 1, 1000)
      true ->
        root <> url
    end
  end

  # Make it easier to mock Responses
  case Mix.env do
    # :test ->
    #   def process_response_body(body) do
    #     body
    #     |> _process_response_body
    #     |> ElasticEmail.MockServer.dump
    #   end
    _ ->
      def process_response_body(body), do:  _process_response_body(body)
  end

  defp _process_response_body(body), do: Poison.decode!(body, keys: :atoms)
end
