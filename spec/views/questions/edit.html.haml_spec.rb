require 'rails_helper'

RSpec.describe "questions/edit", :type => :view do
  before(:each) do
    @question = assign(:question, Question.create!(
      :description => "MyDescription",
      :answer_type => "Text",
      :marks => 1,
      :correct_answer => "MyAnswer"
    ))
  end

  it "renders the edit question form" do
    render

    assert_select "form[action=?][method=?]", question_path(@question), "post" do

      assert_select "textarea#question_description[name=?]", "question[description]"

      assert_select "select#question_answer_type[name=?]", "question[answer_type]"

      assert_select "input#question_marks[name=?]", "question[marks]"

      assert_select "textarea#question_correct_answer[name=?]", "question[correct_answer]"
    end
  end
end
