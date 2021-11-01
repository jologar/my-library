alias Mylibrary.Services.Book, as: BookService
alias Mylibrary.Schemas.Book, as: Book

defmodule MylibraryWeb.BooksController do
  use MylibraryWeb, :controller

  def index(conn, _params) do
    # Retrieve books
    books = BookService.find_all()
    render(conn, "index.html", books: books)
  end

  def create(conn, params) do
    book_info = params["book"]
    # Create a new user with the info passed by parameter
    %Book{}
      |> Book.changeset(book_info)
      |> BookService.insert()
    # TODO: Handle errors
    # Once created, we redirect to the main books list
    redirect(conn, to: Routes.books_path(conn, :index))
  end

  def show(conn, %{"id" => book_id}) do
    # Retrieves the book with the id passed by :id uri param
    book = BookService.find_by_id(book_id)
    # TODO: Error page if no book found
    render(conn, "show.html", book: book)
  end

  def new(conn, _params) do
    changeset = Book.changeset(%Book{})
    # Render the book creation page
    render(conn, "new.html", changeset: changeset)
  end

  def edit(conn, %{"id" => book_id}) do
    # Retrieves the book with the id passed by :id uri param
    book = BookService.find_by_id(book_id)
    changeset = Book.changeset(book)
    # TODO: Error handling
    # Render the edit page passing the info of the book to edit
    render(conn, "edit.html", %{book: book, changeset: changeset})
  end

  def delete(conn, %{"id" => book_id}) do
    # Delete the book with :id
    BookService.delete(book_id)
    redirect(conn, to: Routes.books_path(conn, :index))
  end

  def update(conn, %{"id" => book_id} = params) do
    book_info = params["book"]
    # Update the book with the info retrieved by parameters
    BookService.find_by_id(book_id)
      |> Book.changeset(book_info)
      |> BookService.update()
    # Redirect to the updated book page
    redirect(conn, to: Routes.books_path(conn, :show, book_id))
  end
end
