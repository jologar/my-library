import Ecto.Query
alias Mylibrary.Repo, as: Repo
alias Mylibrary.Schemas.Book, as: Book

defmodule Mylibrary.Services.Book do

  @doc """
    Returns a list with all the books in the model
  """
  def find_all() do
    books = Repo.all(Book)
    # TODO: Check query result and manage errors
    books
  end

  @doc """
    param: string to query

    Returns a list of books that have a searchable field matching with the query string
    Searchable fields by now [title, author, isbn]
  """
  def find_by_query(query) do
    like_query = "%#{query}%"
    Repo.all(
      from b in Book,
      where: ilike(b.title, ^like_query),
      or_where: ilike(b.author, ^like_query),
      or_where: ilike(b.isbn, ^like_query)
    )
  end

  @doc """
    Returns a the book with the id passed by parameter
  """
  def find_by_id(id) do
    book = Repo.one!(from b in Book, where: b.id == ^id)
    # TODO: Check query result and manage errors
    book
  end

  @doc """
    Deletes the book which id is passed by parameter
  """
  def delete(id) do
    book = find_by_id(id)
    Repo.delete!(book)
  end

  @doc """
    Inserts a new book into the model
  """
  def insert(book) do
    Repo.insert!(book)
    # TODO: Handle errors
  end

  @doc """
    Updates the book with the info passed by parameter
  """
  def update(book) do
    Repo.update!(book)
    # TODO: Handle errors
  end
end
