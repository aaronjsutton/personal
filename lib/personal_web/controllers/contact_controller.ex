defmodule PersonalWeb.ContactController do
  use PersonalWeb, :controller

  def new(conn, _) do
    render(conn, "new.html")
  end
end
