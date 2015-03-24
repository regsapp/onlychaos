module UsersHelper

  def total_answers_count(user)
    user.correct_answers_count + user.incorrect_answers_count
  end

  def correct_percent(user)
    user.correct_answers_count.to_f / total_answers_count(user).to_f * 100
  end

  def incorrect_percent(user)
    user.incorrect_answers_count.to_f / total_answers_count(user).to_f * 100
  end

end
