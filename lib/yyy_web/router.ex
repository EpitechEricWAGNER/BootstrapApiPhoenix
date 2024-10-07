defmodule TodolistWeb.Router do
  use TodolistWeb, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/api", TodolistWeb do
    pipe_through :api

    resources "/users", UserController, except: [:new, :edit]

    resources "/tasks", TaskController, except: [:new, :edit] do
      get "/users/:idUser", TaskController, :index_by_user
    end
  end
end
