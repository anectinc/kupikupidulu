json.array!(@media) do |medium|
  json.extract! medium, :id, :article_id, :file, :file_tmp, :url, :type
  json.url medium_url(medium, format: :json)
end
