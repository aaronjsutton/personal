defmodule PersonalWeb.Router do
  use PersonalWeb, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", PersonalWeb do
    pipe_through :browser

    get "/hire", ContactController, :new
    post "/hire", ContactController, :create

  end
end
