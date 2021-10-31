import Ecto.Query
alias Mylibrary.Repo, as: Repo
alias Mylibrary.Schemas.Book, as: Book

defmodule Mylibrary.Services.Book do
  def find_all() do
    books = Repo.all(Book)
    # TODO: Check query result and manage errors
    books
  end

  def find_by_id(id) do
    book = Repo.one(from b in Book, where: b.id == ^id)
    # TODO: Check query result and manage errors
    book
  end
end
