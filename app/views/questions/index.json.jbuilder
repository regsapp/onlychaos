json.array!(@questions) do |question|
  json.extract! question, :id, :description, :answer_type, :marks, :correct_answer
  json.url question_url(question, format: :json)
end
