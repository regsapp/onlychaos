require 'rails_helper'

RSpec.describe "answers/show", :type => :view do
  before(:each) do
    @answer = assign(:answer, Answer.create!(
      :question_id => 1,
      :description => "MyText"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/MyText/)
  end
end
