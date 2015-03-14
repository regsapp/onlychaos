require 'factory_girl_rails'
FactoryGirl.define do

  factory :test do
    year_group
    duration 30
    user
  end

  factory :category do
    sequence(:name){|n| "name#{n}" }
  end

  factory :year_group do
    sequence(:name){|n| "name#{n}" }
  end
  
  factory :school do
    sequence(:name){|n| "name#{n}" }
  end

  factory :user do
    sequence(:email){|n| "user#{n}@example.com" }
    password               "password"
  end

  factory :admin do
    sequence(:email){|n| "admin#{n}@example.com" }
    password               "password"
  end

  factory :student do
    sequence(:email){|n| "student#{n}@example.com" }
    password               "password"
    first_name             "John"
    last_name              "Doe"
    birthday               16.years.ago
    school
  end

  factory :question do
    description 'What is ...'
    answer_type  'text'
    marks 1
    category
    year_group

    factory :integer_question do
      answer_type  'integer'
    end

    factory :text_question do
      answer_type  'text'
    end

    factory :float_question do
      answer_type  'float'
    end

    factory :formula_question do
      answer_type  'formula'
    end

    factory :multiple_any_question do
      answer_type  'multiple any'
    end

    factory :multiple_all_question do
      answer_type  'multiple all'
    end

    factory :multiple_bool_question do
      answer_type  'multiple bool'
    end
  end

  factory :answer do
    content "My Answer"
    question

    factory :integer_answer do
      content  '10'
      integer_question
    end

    factory :text_answer do
      content  "My Answer"
      text_question
    end

    factory :float_answer do
      content  '9.99'
      float_question
    end

    factory :formula_answer do
      content  '`ax^2+by+c`'
      formula_question
    end

    factory :multiple_any_answer do
      content  'Audi VW Mercedes'
      multiple_any_question
    end

    factory :multiple_all_answer do
      content  'Audi VW Mercedes'
      multiple_all_question
    end

    factory :multiple_bool_answer do
      content  'Audi VW Mercedes'
      multiple_bool_question
    end
  end
end