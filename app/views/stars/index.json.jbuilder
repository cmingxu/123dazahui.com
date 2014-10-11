json.array!(@stars) do |star|
  json.extract! star, :id, :name, :gender, :country, :dob, :constellation, :career, :height, :rate, :blood, :home_town, :school, :company, :weight, :religon, :hobby, :desc, :desc_short, :achievement, :event, :source
  json.url star_url(star, format: :json)
end
