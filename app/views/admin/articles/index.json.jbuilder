json.array!(@articles) do |article|
  json.extract! article, :id, :category_id, :title, :description, :source_name, :source_url, :poster_name, :twitter_shared_count, :facebook_shared_count, :shared_count, :deleted_at
  json.url article_url(article, format: :json)
end
