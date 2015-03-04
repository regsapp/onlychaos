require 'factory_girl_rails'
FactoryGirl.define do
  factory :question do
    description 'What is ...'
    correct_answer  'Correct answer'
    answer_type  'Text'
    marks 1

    factory :float_question do
      answer_type  'Float'
      correct_answer  '9.99'
    end

    factory :integer_question do
      answer_type  'Integer'
      correct_answer  '10'
    end

    factory :math_question do
      answer_type  'Math Formula'
      correct_answer  '`ax^2+by+c`'
    end
  end
end