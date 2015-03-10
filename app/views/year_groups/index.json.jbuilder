json.array!(@year_groups) do |year_group|
  json.extract! year_group, :id, :name
  json.url year_group_url(year_group, format: :json)
end
