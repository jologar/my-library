defmodule Mylibrary.Services.BookImage do
  @base_uploads_folder "./priv/static"
  @images_folder "/images/uploaded"

  @doc """
    This function takes the book information as parameter, uploads a temporary image
    to the images folder and returns a path relative to a base_uploads_folder
  """
  def upload_book_image(book_info) do
    # Check if an image for upload exists
    if upload = book_info["image"] do
      # Build the image path
      final_file_name = "#{book_info["isbn"]}#{Path.extname(upload.filename)}"
      copy_file_path = [@base_uploads_folder, @images_folder, final_file_name]
        |> Path.join()
      # Upload image to the final uploads folder
      File.copy!(upload.path, copy_file_path)
      # Return the file info
      [@images_folder, final_file_name]
        |> Path.join()
    end
  end
end
