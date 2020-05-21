defmodule Personal.Email do
  defstruct [:address, :subject, :body]

  def cast(params) do
    struct(__MODULE__, address: params["address"], subject: params["subject"], body: params["body"])
  end
end

defimpl Jason.Encoder, for: Personal.Email do
  def encode(value, opts) do
    %{
      personalizations: [
        %{
          to: [
            %{
              email: "aaron@aaronjsutton.com"
            }
          ]
        }
      ],
      subject: value.subject,
      from: %{email: "contact@aaronjsutton.com", name: "Contact Form Agent"},
      content: [
        %{
          type: "text/plain",
          value: value.body <> " -- #{value.address}"
        }
      ],
      mail_settings: %{
        sandbox_mode: %{
          enable: false
        }
      }
    } |> Jason.Encode.map(opts)
  end
end
