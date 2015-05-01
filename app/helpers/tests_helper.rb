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

  def ocr_as_units(unit)
    unit.categories.each do |category|
      if category.year = "AS" && category.exam_board_id == 1
        return true
      end
    end
  end

  def display_ocr_as_units(unit)
    # ocr_as_units = []
    if ocr_as_units(unit) == true
      # ocr_as_units << unit
      return unit.name
    end
  end








end
