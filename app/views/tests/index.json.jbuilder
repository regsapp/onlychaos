json.array!(@tests) do |test|
  json.extract! test, :id, :year_group_id, :duration, :user_id
  json.url test_url(test, format: :json)
end
