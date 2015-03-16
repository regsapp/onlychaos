require 'rails_helper'

RSpec.describe "ExamBoards", type: :request do
  describe "GET /exam_boards" do
    it "works! (now write some real specs)" do
      get exam_boards_path
      expect(response).to have_http_status(200)
    end
  end
end
