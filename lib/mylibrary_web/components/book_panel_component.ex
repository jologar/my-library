alias MylibraryWeb.Router.Helpers, as: Routes

defmodule Mylibrary.BookPanel do
  use Phoenix.Component
  use Phoenix.HTML

  def panel(assigns) do
    ~H"""
    <div class="book-panel">
      <div class="book-panel__content">
        <div class="book-panel__image">
          <%= if assigns.book.image do %>
            <img src={Routes.static_path(MylibraryWeb.Endpoint, assigns.book.image)} />
          <% end %>
        </div>
        <div class="book-panel__info">
            <div class="book-panel__info__title">
              <h4><%= assigns.book.title %></h4>
            </div>
            <div class="book-panel__info__field">
              <span class="my-label">Author: </span><%= assigns.book.author %>
            </div>
            <div class="book-panel__info__field">
              <span class="my-label">ISBN: </span><%= assigns.book.isbn %>
            </div>
            <div class="book-panel__info__field">
              <span class="my-label">Pages: </span><%= assigns.book.pages %>
            </div>
            <div class="book-panel__info__description">
              <%= assigns.book.description %>
            </div>
        </div>
      </div>
      <div class="book-panel__actions">
        <%= render_block(@inner_block) %>
      </div>
    </div>
    """
  end
end
