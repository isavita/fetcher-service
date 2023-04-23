defmodule FetcherServiceWeb.Router do
  use FetcherServiceWeb, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/api", FetcherServiceWeb do
    pipe_through :api
  end
end
