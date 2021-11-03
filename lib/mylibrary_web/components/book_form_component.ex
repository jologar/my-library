alias MylibraryWeb.Router.Helpers, as: Routes

defmodule Mylibrary.BookForm do
  @moduledoc """
    Implements a reusable book form that can be used for creation and modification of
    an existing book.
  """
  use Phoenix.Component
  use Phoenix.HTML

  def form(assigns) do
    ~H"""
    <%= form_for assigns.changeset, assigns.route, [multipart: true, class: "book-form"], fn f -> %>
      <div class="book-form__image">
        <%= if Map.has_key?(assigns, :book) do %>
          <%= if assigns.book.image do %>
            <img src={Routes.static_path(MylibraryWeb.Endpoint, assigns.book.image)} />
          <% end %>
        <% end %>
        <label>
          <%= file_input f, :image %>
        </label>
      </div>
      <div class="my-column">
        <div class="my-row">
          <div class="book-form__field">
            <div class="book-form__field__label">Title</div>
            <%= text_input f, :title %>
          </div>
          <div class="book-form__field">
            <div class="book-form__field__label">Author</div>
            <%= text_input f, :author %>
          </div>
        </div>
        <div class="my-row">
          <div class="book-form__field">
            <div class="book-form__field__label">ISBN</div>
            <%= text_input f, :isbn %>
          </div>
          <div class="book-form__field">
            <div class="book-form__field__label">Pages</div>
            <%= number_input f, :pages %>
          </div>
        </div>
        <div class="my-row">
          <div class="book-form__field">
            <div class="book-form__field__label">Description</div>
            <%= textarea f, :description, class: "book-form__field__textarea" %>
          </div>
        </div>
        <div class="my-row">
          <div class="book-form__actions">
            <%= submit "Submit", class: "my-btn my-primary-btn" %>
          </div>
        </div>
      </div>
    <% end %>
    """
  end
end
