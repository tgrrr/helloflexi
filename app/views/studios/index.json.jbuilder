json.array!(@studios) do |studio|
  json.extract! studio, :id, :user_id, :logo, :description
  json.url studio_url(studio, format: :json)
end
