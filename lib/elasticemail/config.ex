defmodule ElasticEmail.Config do
  @moduledoc """
  ElasticEmail Config Module
  """

  @default_api_version "v2"

  @doc """
  Return configured API Key
  ### Examples
      iex> Application.put_env(:elasticemail, :api_key, "your apikey")
      iex> ElasticEmail.Config.api_key!()
      "your apikey"
  """
  @spec api_key!() :: String.t | no_return
  def api_key!, do: Application.fetch_env!(:elasticemail, :api_key)

  @doc """
  Return configured API Version
  ### Examples
      iex> Application.put_env(:elasticemail, :api_version, "1.0")
      iex> ElasticEmail.Config.api_version()
      "1.0"
      iex> Application.delete_env(:elasticemail, :api_version)
      iex> ElasticEmail.Config.api_version()
      "2.0"
  """
  @spec api_version() :: String.t
  def api_version, do: Application.get_env(:elasticemail, :api_version, @default_api_version)

  @doc """
  Return configured API Version
  ### Examples
      iex> Application.put_env(:elasticemail, :api_key, "your apikey")
      iex> Application.delete_env(:elasticemail, :api_version)
      iex> ElasticEmail.Config.root_endpoint!()
      "https://api.elasticemail.com/v2/"
  """
  @spec root_endpoint!() :: String.t | no_return
  def root_endpoint! do
    "https://api.elasticemail.com/#{api_version()}/"
  end
end
