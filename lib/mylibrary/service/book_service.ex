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
    book = Repo.one!(from b in Book, where: b.id == ^id)
    # TODO: Check query result and manage errors
    book
  end

  def delete(id) do
    book = find_by_id(id)
    Repo.delete!(book)
  end

  def insert(book) do
    Repo.insert!(book)
    # TODO: Handle errors
  end

  def update(book) do
    Repo.update!(book)
    # TODO: Handle errors
  end
end
