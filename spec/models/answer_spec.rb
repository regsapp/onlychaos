require 'rails_helper'

RSpec.describe Answer, :type => :model do
  describe "max_marks" do
    before do
      @question_part = create(:question_part)
      @answer = @question_part.answers.build(attributes_for(:answer))
    end

    it "should should eq question_part marks" do
      @answer.max_marks.should eq @answer.question_part.marks
    end
  end

  describe "#mark!" do
    before do
      @question_part = create(:question_part)
      @correct_answer = @question_part.create_correct_answer(attributes_for(:answer))
      @answer = @question_part.answers.build(attributes_for(:answer))
    end

    it "should set marks" do
      @answer.marks.should be nil
      @answer.mark!
      @answer.marks.should >= 0
    end

    it "should set zero marks if answer is blank" do
      @answer.content = ""
      @answer.mark!
      @answer.marks.should equal 0
    end

    it "should set marks if answer is correct" do
      @answer.content = @answer.correct_answer.content
      @answer.mark!
      @answer.marks.should equal @answer.max_marks
    end

    context "boolean" do
      before do
        @question_part = create(:multiple_bool_question_part)
        @correct_answer = @question_part.build_correct_answer(attributes_for(:multiple_bool_answer))
        @correct_answer.content = "(John OR Mary) AND (Dave OR Pat)"
        @answer = @question_part.answers.build(attributes_for(:answer))
      end

      it "should set zero marks if answer is not correct" do
        @answer.content = "John, Mary"
        @answer.mark!.should equal 0
        @answer.content = "Dave"
        @answer.mark!.should equal 0
      end

      it "should set marks if answer is correct" do
        @answer.content = "John, Dave"
        @answer.mark!.should > 0
        @answer.content = "Mary Pat"
        @answer.mark!.should > 0
      end
    end
  end
end

