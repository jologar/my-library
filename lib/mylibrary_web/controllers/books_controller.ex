alias Mylibrary.Services.Book, as: BookService

defmodule MylibraryWeb.BooksController do
  use MylibraryWeb, :controller

  def index(conn, _params) do
    # Retrieve books
    books = BookService.find_all()
    render(conn, "index.html", books: books)
  end

  def show(conn, %{"id" => book_id}) do
    # Retrieves the book with the id passed by :id uri param
    book = BookService.find_by_id(book_id)
    # TODO: Error page if no book found
    render(conn, "show.html", book: book)
  end

  def edit(conn, %{"id" => book_id}) do

  end
end
