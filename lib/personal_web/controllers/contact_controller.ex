defmodule PersonalWeb.ContactController do
  use PersonalWeb, :controller

  def new(conn, _) do
    conn |> assign(:page_title, "Aaron Sutton – Hire Me") |> render("new.html")
  end

  def create(conn, %{"email" => params}) do
    email = Personal.Email.cast(params)
    case Personal.Mailer.send(email) do
      {:ok, 202} ->
        conn
        put_flash(conn, :info, "Your email has been sent.")
      {:error, error} ->
        put_flash(conn, :info, "#{error}. Please try again later 
          or email direct to aaron@aaronjsutton.com")
    end |> redirect(to: Routes.contact_path(conn, :new))
  end
end
