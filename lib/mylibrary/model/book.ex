defmodule Mylibrary.Schemas.Book do
  use Ecto.Schema
  import Ecto.Changeset

  schema "books" do
    field :author, :string
    field :description, :string
    field :isbn, :string
    field :pages, :integer
    field :title, :string
    field :image, :string

    timestamps()
  end

  @doc false
  def changeset(book, attrs \\ %{}) do
    book
    |> cast(attrs, [:title, :author, :isbn, :description, :pages, :image])
    |> validate_required([:title, :author, :isbn, :description, :pages])
  end
end
