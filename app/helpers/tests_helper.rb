module TestsHelper

  def total_answers_count(test)
    test.correct_answers_count + test.incorrect_answers_count
  end

  def correct_percent(test)
    test.correct_answers_count.to_f / total_answers_count(test).to_f * 100
  end

  def incorrect_percent(test)
    test.incorrect_answers_count.to_f / total_answers_count(test).to_f * 100
  end

end
