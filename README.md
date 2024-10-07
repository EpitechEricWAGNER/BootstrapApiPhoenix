# Todolist

To start your Phoenix server:

- Run `mix setup` to install and setup dependencies
- Start Phoenix endpoint with `mix phx.server` or inside IEx with `iex -S mix phx.server`

Now you can visit [`localhost:4000`](http://localhost:4000) from your browser.

Ready to run in production? Please [check our deployment guides](https://hexdocs.pm/phoenix/deployment.html).

## Learn more

- Official website: https://www.phoenixframework.org/
- Guides: https://hexdocs.pm/phoenix/overview.html
- Docs: https://hexdocs.pm/phoenix
- Forum: https://elixirforum.com/c/phoenix-forum
- Source: https://github.com/phoenixframework/phoenix

# Data schemas

## Being a first data schema corresponding to a user

`mix phx.gen.schema User users first_name:string last_name:string`

## A second schema corresponding to a task

`mix phx.gen.schema Task tasks title:string description:text status:string user_id:references:users`

`mix ecto.migrate`

# Routes

ewagner@webServer:/var/www/xxx$ mix phx.routes

- GET /api/users TodolistWeb.UserController :index
- GET /api/users/:id TodolistWeb.UserController :show
- POST /api/users TodolistWeb.UserController :create
- PATCH /api/users/:id TodolistWeb.UserController :update
- PUT /api/users/:id TodolistWeb.UserController :update
- DELETE /api/users/:id TodolistWeb.UserController :delete
- WS /live/websocket Phoenix.LiveView.Socket
- GET /live/longpoll Phoenix.LiveView.Socket
- POST /live/longpoll Phoenix.LiveView.Socket
