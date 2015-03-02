require 'rails_helper'

RSpec.describe "questions/index", :type => :view do
  before(:each) do
    assign(:questions, [
      Question.create!(
        :description => "MyText",
        :answer_type => "Answer Type",
        :marks => 1,
        :correct_answer => "MyText"
      ),
      Question.create!(
        :description => "MyText",
        :answer_type => "Answer Type",
        :marks => 1,
        :correct_answer => "MyText"
      )
    ])
  end

  it "renders a list of questions" do
    render
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => "Answer Type".to_s, :count => 2
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
  end
end
