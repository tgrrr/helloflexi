json.array!(@blacklists) do |blacklist|
  json.extract! blacklist, :id, :start_date, :end_date, :klass_id
  json.url blacklist_url(blacklist, format: :json)
end
