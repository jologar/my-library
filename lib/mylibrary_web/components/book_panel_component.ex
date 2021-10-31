defmodule Mylibrary.BookPanel do
  use Phoenix.Component

  def panel(assigns) do
    ~H"""
    <div class="book-panel">
      <div class="book-panel__actions">
        <%= render_block(@inner_block) %>
      </div>
      <div class="book-panel__content">
        <div class="book-panel__img">
        </div>
        <div class="book-panel__info">
            <div class="book-panel__title">
              <%= assigns.book.title %>
            </div>
            <div class="book-panel__author">
              <%= assigns.book.author %>
            </div>
            <div class="book-panel__isbn">
              <%= assigns.book.isbn %>
            </div>
            <div class="book-panel__description">
              <%= assigns.book.description %>
            </div>
        </div>
      </div>
    </div>
    """
  end
end
