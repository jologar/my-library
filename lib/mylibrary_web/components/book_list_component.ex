defmodule Mylibrary.BookList do
  use Phoenix.Component

  def card_list(assigns) do
    ~H"""
    <div class="book-list">
      <%= for book <- assigns.books do%>
        <div class="book-list__item">
          <Mylibrary.BookCard.book_card book={book} />
        </div>
      <% end %>
    </div>
    """
  end
end
