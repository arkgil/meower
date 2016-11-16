defmodule Meower.Router do
  use Meower.Web, :router

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

  scope "/", Meower do
    pipe_through :browser # Use the default browser stack

    get "/", PageController, :index
  end

  scope "/api", Meower do
    resources "/posts", PostController, only: [:index, :show, :create]
  end

end
