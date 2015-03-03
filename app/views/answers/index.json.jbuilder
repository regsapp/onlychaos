json.array!(@answers) do |answer|
  json.extract! answer, :id, :question_id, :description, :marks
  json.url answer_url(answer, format: :json)
end
