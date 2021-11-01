defmodule MylibraryWeb.MainController do
  use MylibraryWeb, :controller

  def index(conn, _params) do
    redirect(conn, to: Routes.books_path(conn, :index))
  end
end
