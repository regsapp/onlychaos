require "rails_helper"

RSpec.describe YearGroupsController, :type => :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/year_groups").to route_to("year_groups#index")
    end

    it "routes to #new" do
      expect(:get => "/year_groups/new").to route_to("year_groups#new")
    end

    it "routes to #show" do
      expect(:get => "/year_groups/1").to route_to("year_groups#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/year_groups/1/edit").to route_to("year_groups#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/year_groups").to route_to("year_groups#create")
    end

    it "routes to #update" do
      expect(:put => "/year_groups/1").to route_to("year_groups#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/year_groups/1").to route_to("year_groups#destroy", :id => "1")
    end

  end
end
