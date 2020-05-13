defmodule PersonalWeb.ContactController do
  use PersonalWeb, :controller

  def new(conn, _) do
    conn |> assign(:page_title, "Aaron Sutton – Hire Me") |> render("new.html")
  end

  def create(conn, params) do
      
  end
end
