defmodule Todolist.Repo do
  use Ecto.Repo,
    otp_app: :yyy,
    adapter: Ecto.Adapters.MyXQL
end
