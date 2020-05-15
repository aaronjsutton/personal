defmodule Personal.Mailer do
  @moduledoc """
  Mailer adapter, written for SendGrid.
  """

  @api_endpoint "https://api.sendgrid.com/v3/mail/send"

  def send(%Personal.Email{} = email, opts \\ []) do
    with {:ok, body} <- Jason.encode email do
      # Make request...
      {:ok, :queued} # status code from API
    else
      error -> {:error, "An error occurred"}
    end
  end
end
