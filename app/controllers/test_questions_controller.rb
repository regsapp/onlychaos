class TestQuestionsController < ApplicationController
  before_action :set_test_question, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!
  load_and_authorize_resource param_method: :test_questions_params

  # GET /test_questions
  # GET /test_questions.json
  def index
    @test_questions = TestQuestion.all
  end

  # GET /test_questions/1
  # GET /test_questions/1.json
  def show
  end

  # GET /test_questions/new
  def new
    @test_question = TestQuestion.new
  end

  # GET /test_questions/1/edit
  def edit
  end

  # POST /test_questions
  # POST /test_questions.json
  def create
    @test_question = TestQuestion.new(test_question_params)

    respond_to do |format|
      if @test_question.save
        format.html { redirect_to @test_question, notice: 'Test question was successfully created.' }
        format.json { render :show, status: :created, location: @test_question }
      else
        format.html { render :new }
        format.json { render json: @test_question.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /test_questions/1
  # PATCH/PUT /test_questions/1.json
  def update
    respond_to do |format|
      @test_question.assign_attributes(test_question_params)
      @test_question.attempts += 1
      if @test_question.save
        alert, notice = nil
        notice = 'Well done, all correct!'               if @test_question.correct?
        alert  = 'One or more of your answers was incorrect. Take a look at the hints below' if !@test_question.correct? && @test_question.next_chance?
        alert  = 'One or more of your answers was incorrect'           if !@test_question.correct? && !@test_question.next_chance? && !@test_question.last?

        if @test_question.next_test_question
          format.html { redirect_to edit_test_question_path(@test_question.next_test_question), alert: alert, notice: notice }
        elsif @test_question.tutorial?
          current_user.tutorial_completed = true
          current_user.save!
          format.html { redirect_to dashboard_path(@test_question.test), notice: "Well done! Now do some real stuff. Click 'Take a Test' below to get started" }
        else
          format.html { redirect_to test_path(@test_question.test) , alert: alert, notice: notice }
        end
        format.json { render :show, status: :ok, location: @test_question }
      else
        format.html { render :edit }
        format.json { render json: @test_question.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /test_questions/1
  # DELETE /test_questions/1.json
  def destroy
    @test_question.destroy
    respond_to do |format|
      format.html { redirect_to test_questions_url, notice: 'Test question was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_test_question
      @test_question = TestQuestion.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def test_question_params
      params.require(:test_question).permit(answers_attributes: [:id, :content])
    end
end
