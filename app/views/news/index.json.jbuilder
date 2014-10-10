json.array!(@news) do |news|
  json.extract! news, :id, :title, :source, :description, :cate, :subcate
  json.url news_url(news, format: :json)
end
