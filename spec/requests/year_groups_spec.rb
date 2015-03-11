require 'rails_helper'

RSpec.describe "YearGroups", :type => :request do

  # see : http://stackoverflow.com/questions/5787409/stubbing-authentication-in-request-spec
  # def login(user)
  #   post user_session_path, :email => user.email, :password => 'password'
  # end

  # before(:each) do
  #   @current_user = create(:admin)
  #   login(@current_user)
  # end

  describe "GET /year_groups" do
    it "works! (now write some real specs)" do
      get year_groups_path
      expect(response).to have_http_status(200)
    end
  end
end
