defmodule Mylibrary.Repo.Migrations.CreateBooks do
  use Ecto.Migration

  def change do
    create table(:books) do
      add :title, :string
      add :author, :string
      add :isbn, :string
      add :description, :string
      add :pages, :integer

      timestamps()
    end
  end
end
