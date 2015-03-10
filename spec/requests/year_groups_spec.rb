require 'rails_helper'

RSpec.describe "YearGroups", :type => :request do
  describe "GET /year_groups" do
    it "works! (now write some real specs)" do
      get year_groups_path
      expect(response).to have_http_status(200)
    end
  end
end
