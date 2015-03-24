module Stats
  extend ActiveSupport::Concern

  def stats
    stats = {}
    answers.each do |answer|
      [:all, answer.category_name].each do |aggregation|
        stats[aggregation] ||= Hash.new(0)
        stats[aggregation][:correct_answers_count] += answer.correct? ? 1 : 0
        stats[aggregation][:questions_count] += 1
        stats[aggregation][:marks] += answer.marks
        stats[aggregation][:max_marks] += answer.max_marks
      end
    end
    stats
  end

  def correct_answers_count(aggregation=:all)
    stats[aggregation][:correct_answers_count]
  end

  def incorrect_answers_count(aggregation=:all)
    stats[aggregation][:questions_count] - stats[aggregation][:correct_answers_count]
  end

  def percentage(aggregation=:all)
    stats[aggregation][:correct_answers_count].to_f / stats[aggregation][:questions_count] * 100
  end

  def grade(aggregation=:all)
    case percentage(aggregation)
    when 85..100
      "A"
    when 75...85
      "B"
    when 65...75
      "C"
    when 55...65
      "D"
    when 45...55
      "E"
    when 0...45
      "Fail"
    else
      nil
    end
  end
end