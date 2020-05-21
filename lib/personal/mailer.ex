defmodule Personal.Mailer do
  @moduledoc """
  Mailer adapter, written for SendGrid.
  """

  @api_endpoint "https://api.sendgrid.com/v3/mail/send"

  def send(%Personal.Email{} = email, opts \\ []) do
    with {:ok, req_body} <- Jason.encode(email),
         {:ok, key} <- get_sendgrid_key()
    do
      {:ok, {{_, status, _}, _, _}} = 
        :httpc.request(:post, {to_charlist(@api_endpoint), [{'Authorization', 'Bearer #{key}'}], 'application/json', to_charlist(req_body)}, [], [])
      {:ok, status} # status code from API
    else
      error -> {:error, "An internal error occurred"}
    end
  end

  defp get_sendgrid_key do
    Keyword.fetch(Application.get_env(:personal, __MODULE__), :api_key)
  end
end
