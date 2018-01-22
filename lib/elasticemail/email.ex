defmodule ElasticEmail.Email do
  @moduledoc """
  Email calls for ElasticEmail.
  """

  alias HTTPoison.Response
  alias ElasticEmail.HTTPClient

  @doc """
  Get email batch status
  """
  def getstatus(params \\ []) do
    HTTPClient.get_request("email/getstatus", params)
  end

  @doc """
  Submit emails. The HTTP POST request is suggested.
  The default, maximum (accepted by us) size of an email
  is 10 MB in total, with or without attachments included.
  For suggested implementations please
  refer to https://elasticemail.com/support/http-api/
  """
  def send(params \\ []) do
    HTTPClient.post_request("email/send", params)
  end

  @doc """
  Detailed status of a unique email sent through your account.
  Returns a 'Email has expired and the status is unknown.' error,
  if the email has not been fully processed yet.
  """
  def status(params \\ []) do
    HTTPClient.get_request("email/status", params)
  end

  @doc """
  View email
  """
  def view(params \\ []) do
    HTTPClient.get_request("email/view", params)
  end
end
