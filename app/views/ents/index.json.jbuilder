json.array!(@ents) do |ent|
  json.extract! ent, :id, :title, :desc, :link, :author, :pub
  json.url ent_url(ent, format: :json)
end
