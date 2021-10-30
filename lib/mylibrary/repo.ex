defmodule Mylibrary.Repo do
  use Ecto.Repo,
    otp_app: :mylibrary,
    adapter: Ecto.Adapters.Postgres

  # Overwrite repo configuration in order to use environment variables for datasource connection
  def init(_, config) do
    config = config
      |> Keyword.put(:username, System.get_env("PGUSER"))
      |> Keyword.put(:password, System.get_env("PGPASSWORD"))
      |> Keyword.put(:database, System.get_env("PGDATABASE"))
      |> Keyword.put(:hostname, System.get_env("PGHOST"))
      |> Keyword.put(:port, System.get_env("PGPORT") |> String.to_integer)
    {:ok, config}
  end
end
