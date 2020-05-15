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
          email: value.address
        }
      ],
      subject: value.subject,
      from: "contact@aaronjsutton.com",
      content: [
        %{
          type: "text/plain",
          value: value.body
        }
      ]
    } |> Jason.Encode.map(opts)
  end
end
