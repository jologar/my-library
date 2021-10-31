alias Mylibrary.Repo, as: Repo
alias Mylibrary.Book, as: Book

defmodule MylibraryWeb.BooksController do
  use MylibraryWeb, :controller

  def index(conn, _params) do
    # Repo.insert(%Book{title: "Titulo libro", pages: 156, isbn: "6546456", description: "cosas", author: "Testo testez"})
    # Retrieve books
    books = Repo.all(Book)
    render(conn, "index.html", books: books)
  end
end
