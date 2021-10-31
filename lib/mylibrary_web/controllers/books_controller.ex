defmodule MylibraryWeb.BooksController do
  use MylibraryWeb, :controller

  def index(conn, params) do
    # Retrieve books
    render(conn, "index.html")
  end
end
