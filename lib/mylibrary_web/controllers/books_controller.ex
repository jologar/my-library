alias Mylibrary.Repo, as: Repo
alias Mylibrary.Book, as: Book

defmodule MylibraryWeb.BooksController do
  use MylibraryWeb, :controller

  def index(conn, _params) do
    # Retrieve books
    books = Repo.all(Book)
    render(conn, "index.html", books: books)
  end

  def show(conn, _params) do
    render(conn, "show.html")
  end
end
