json.array!(@pages) do |page|
  json.extract! page, :id, :title, :content, :desc, :slug, :published_at, :source
  json.url page_url(page, format: :json)
end
