require 'rails_helper'

RSpec.describe "questions/index", :type => :view do
  before(:each) do
    assign(:questions, [
      Question.create!(
        :description => "MyDescription",
        :answer_type => "Text",
        :marks => 1,
        :correct_answer => "MyAnswer"
      ),
      Question.create!(
        :description => "MyDescription",
        :answer_type => "Text",
        :marks => 1,
        :correct_answer => "MyAnswer"
      )
    ])
  end

  it "renders a list of questions" do
    render
    assert_select "tr>td", :text => "MyDescription".to_s, :count => 2
    assert_select "tr>td", :text => "Text".to_s, :count => 2
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => "MyAnswer".to_s, :count => 2
  end
end
