defmodule Mylibrary.Repo.Migrations.ImageColumn do
  use Ecto.Migration

  def change do
    alter table("books") do
      add :image, :text
    end
  end
end
