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
          <%= if assigns.book.image do %>
            <img src={Routes.static_path(MylibraryWeb.Endpoint, assigns.book.image)} class="book-card__image" />
          <% end %>
          <div class="book-card__info">
            <div class="book-card__info__title">
              <h6><%= assigns.book.title %></h6>
            </div>
            <div class="book-card__info__field">
              <span class="my-label">Author:</span> <%= assigns.book.author %>
            </div>
            <div class="book-card__info__field">
              <span class="my-label">ISBN:</span> <%= assigns.book.isbn %>
            </div>
            <div class="book-card__info__field">
              <span class="my-label">Pages:</span> <%= assigns.book.pages %>
            </div>
          </div>
        <% end %>
        <%= link to: Routes.books_path(MylibraryWeb.Endpoint, :delete, assigns.book.id),
            method: :delete,
            data: [confirm: "Are you sure?"],
            class: "book-card__delete" do %>
            <img src={Routes.static_path(MylibraryWeb.Endpoint, "/images/delete_white.png")} alt="Delete"/>
        <% end %>
    </div>
    """
  end
end
