require 'rails_helper'

RSpec.describe Question, :type => :model do
  describe "#mark(answer)" do
    it "should return zero if answer is blank" do
      question =  FactoryGirl.create(:question)
      question.mark("").should be 0
    end

    it "should return marks if answser is correct" do
      question =  FactoryGirl.create(:question)
      question.mark(question.correct_answer).should be question.marks
    end
  end
end
