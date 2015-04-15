module DashboardHelper

  def motivational_message(user)
    if user.grade == "A"
      a_grade.sample
    elsif user.grade == "B"
      b_grade.sample
    elsif user.grade == "C"
      c_grade.sample
    elsif user.grade == "D"
      d_grade.sample
    elsif user.grade == "E"
      e_grade.sample
    else
      f_grade.sample
    end
  end

  def a_grade
    a_grade = [
      "Go chill, you've got this",
      "I got lost in my thoughts. It was unfamiliar territory. You, on the other hand, are fine!",
      "A neutron walked into a bar and asked, 'How much for a drink?' The bartender replied, 'For you, no charge.'"
    ]
  end

  def b_grade
    b_grade = [
      "Knowledge is knowing a tomato is a fruit; Wisdom is knowing not to put it in a fruit salad.",
      "Where does bad light end up? In a prism"
    ]
  end

  def c_grade
    c_grade = [
      "If winning isn't everything why do they keep score?",
      "You've got a pass, keep up the good work",
      "A photon checks into a hotel. The bellhop asks, 'Can I help you with your luggage?' It replies, 'I don't have any, I'm travelling light'"
    ]
  end

  def d_grade
    d_grade = [
      "I like work. It fascinates me. I sit and look at it for hours",
      "I don't have a solution, but I do admire the problem"
    ]
  end

  def e_grade
    e_grade = [
      "The early bird might get the worm, but the second mouse gets the cheese",
      "If I agreed with you, we'd both be wrong"
    ]
  end

  def f_grade
    f_grade = [
      "I'm going to give you the moon door if you don't do some more revision!",
      "Knowledge is power, and power corrupts. So study hard and be evil",
      "A TV can insult your intelligence, but nothing rubs it in like a computer"
    ]
  end

end
