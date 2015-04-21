module Stats
  extend ActiveSupport::Concern

  def stats
    return @stats if @stats

    @stats = {}
    answers.each do |answer|
      next if answer.tutorial?
      [:all, answer.category_name].each do |aggregation|
        @stats[aggregation] ||= Hash.new(0)
        @stats[aggregation][:correct_answers_count] += answer.correct? ? 1 : 0
        @stats[aggregation][:questions_count] += 1
        @stats[aggregation][:marks] += answer.marks
        @stats[aggregation][:max_marks] += answer.max_marks
      end
    end
    @stats
  end

  def correct_answers_count(aggregation=:all)
    return 0 unless stats[aggregation]
    stats[aggregation][:correct_answers_count]
  end

  def incorrect_answers_count(aggregation=:all)
    return 0 unless stats[aggregation]
    stats[aggregation][:questions_count] - stats[aggregation][:correct_answers_count]
  end

  def total_answers_count(aggregation=:all)
    return 0 unless stats[aggregation]
    stats[aggregation][:questions_count]
  end

  def percentage(aggregation=:all)
    return nil unless stats[aggregation]
    stats[aggregation][:correct_answers_count].to_f / stats[aggregation][:questions_count] * 100
  end

  def incorrect_percentage(aggregation=:all)
    return 100 unless stats[aggregation]
    100 - percentage(aggregation)
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
      "F"
    else
      nil
    end
  end
end
