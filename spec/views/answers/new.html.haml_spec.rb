require 'rails_helper'

RSpec.describe "answers/new", :type => :view do
  before(:each) do
    assign(:answer, Answer.new(
      :question_id => 1,
      :description => "MyText"
    ))
  end

  it "renders new answer form" do
    render

    assert_select "form[action=?][method=?]", answers_path, "post" do
      assert_select "textarea#answer_description[name=?]", "answer[description]"
    end
  end
end
