json.extract! book, :id, :user_id, :tag_id, :title, :body, :status, :created_at, :updated_at
json.url book_url(book, format: :json)
