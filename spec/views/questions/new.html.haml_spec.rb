require 'rails_helper'

RSpec.describe "questions/new", :type => :view do
  before(:each) do
    assign(:question, Question.new(
      :description => "MyText",
      :answer_type => "MyString",
      :marks => 1,
      :correct_answer => "MyText"
    ))
  end

  it "renders new question form" do
    render

    assert_select "form[action=?][method=?]", questions_path, "post" do

      assert_select "textarea#question_description[name=?]", "question[description]"

      assert_select "input#question_answer_type[name=?]", "question[answer_type]"

      assert_select "input#question_marks[name=?]", "question[marks]"

      assert_select "textarea#question_correct_answer[name=?]", "question[correct_answer]"
    end
  end
end
