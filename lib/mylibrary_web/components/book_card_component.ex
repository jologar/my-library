alias MylibraryWeb.Router.Helpers, as: Routes

defmodule Mylibrary.BookCard do
  @moduledoc """
  Implements a book card with summarized info about the book passed by parameter, and
  delete and info actions.
  """
  use Phoenix.Component
  use Phoenix.HTML

  def book_card(assigns) do
    ~H"""
    <div class="book-card">
        <%= link to: Routes.books_path(MylibraryWeb.Endpoint, :show, assigns.book.id), class: "book-card__content" do %>
          <div class="book-card__image"></div>
          <div class="book-card__info">
            <div class="book-card__info__title">
              <%= assigns.book.title %>
            </div>
            <div class="book-card__info__author">
              <%= assigns.book.author %>
            </div>
            <div class="book-card__info__isbn">
              <%= assigns.book.isbn %>
            </div>
          </div>
        <% end %>
      <div class="book-card__delete"></div>
    </div>
    """
  end
end
