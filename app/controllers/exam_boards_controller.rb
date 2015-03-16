class ExamBoardsController < ApplicationController
  before_action :set_exam_board, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!
  load_and_authorize_resource param_method: :exam_board_params

  # GET /exam_boards
  # GET /exam_boards.json
  def index
    @exam_boards = ExamBoard.all
  end

  # GET /exam_boards/1
  # GET /exam_boards/1.json
  def show
  end

  # GET /exam_boards/new
  def new
    @exam_board = ExamBoard.new
  end

  # GET /exam_boards/1/edit
  def edit
  end

  # POST /exam_boards
  # POST /exam_boards.json
  def create
    @exam_board = ExamBoard.new(exam_board_params)

    respond_to do |format|
      if @exam_board.save
        format.html { redirect_to @exam_board, notice: 'Exam board was successfully created.' }
        format.json { render :show, status: :created, location: @exam_board }
      else
        format.html { render :new }
        format.json { render json: @exam_board.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /exam_boards/1
  # PATCH/PUT /exam_boards/1.json
  def update
    respond_to do |format|
      if @exam_board.update(exam_board_params)
        format.html { redirect_to @exam_board, notice: 'Exam board was successfully updated.' }
        format.json { render :show, status: :ok, location: @exam_board }
      else
        format.html { render :edit }
        format.json { render json: @exam_board.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /exam_boards/1
  # DELETE /exam_boards/1.json
  def destroy
    @exam_board.destroy
    respond_to do |format|
      format.html { redirect_to exam_boards_url, notice: 'Exam board was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_exam_board
      @exam_board = ExamBoard.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def exam_board_params
      params.require(:exam_board).permit(:name)
    end
end
