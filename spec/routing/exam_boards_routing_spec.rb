require "rails_helper"

RSpec.describe ExamBoardsController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/exam_boards").to route_to("exam_boards#index")
    end

    it "routes to #new" do
      expect(:get => "/exam_boards/new").to route_to("exam_boards#new")
    end

    it "routes to #show" do
      expect(:get => "/exam_boards/1").to route_to("exam_boards#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/exam_boards/1/edit").to route_to("exam_boards#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/exam_boards").to route_to("exam_boards#create")
    end

    it "routes to #update" do
      expect(:put => "/exam_boards/1").to route_to("exam_boards#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/exam_boards/1").to route_to("exam_boards#destroy", :id => "1")
    end

  end
end
