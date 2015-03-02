require 'rails_helper'

RSpec.describe "questions/show", :type => :view do
  before(:each) do
    @question = assign(:question, Question.create!(
      :description => "MyText",
      :answer_type => "Answer Type",
      :marks => 1,
      :correct_answer => "MyText"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/MyText/)
    expect(rendered).to match(/Answer Type/)
    expect(rendered).to match(/1/)
    expect(rendered).to match(/MyText/)
  end
end
