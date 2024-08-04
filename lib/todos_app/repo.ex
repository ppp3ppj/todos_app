defmodule TodosApp.Repo do
  use Ecto.Repo,
    otp_app: :todos_app,
    adapter: Ecto.Adapters.SQLite3
end
