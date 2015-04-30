class SchoolsController < ApplicationController

  def index
    @schools = School.all
  end

  def import
    begin
      School.import(params[:file])
      redirect_to root_url, notice: "Schools imported"
    rescue
      redirect_to root_url, notice: "Invalid file format"
    end
  end

  # before_action :set_school, only: [:show, :edit, :update, :destroy]
  # before_action :authenticate_user!
  # load_and_authorize_resource param_method: :school_params
  #
  # # GET /schools
  # # GET /schools.json
  # def index
  #   @schools = School.all
  # end
  #
  # # GET /schools/1
  # # GET /schools/1.json
  # def show
  # end
  #
  # # GET /schools/new
  def new
    @school = School.new
  end
  #
  # # GET /schools/1/edit
  def edit
    @school = School.find(params[:id])
  end
  #
  # # POST /schools
  # # POST /schools.json
  def create
    @school = School.new(school_params)

    respond_to do |format|
      if @school.save
        format.html { redirect_to @school, notice: 'School was successfully created.' }
        format.json { render :show, status: :created, location: @school }
      else
        format.html { render :new }
        format.json { render json: @school.errors, status: :unprocessable_entity }
      end
    end
  end
  #
  # # PATCH/PUT /schools/1
  # # PATCH/PUT /schools/1.json
  def update
    respond_to do |format|
      if @school.update(school_params)
        format.html { redirect_to @school, notice: 'School was successfully updated.' }
        format.json { render :show, status: :ok, location: @school }
      else
        format.html { render :edit }
        format.json { render json: @school.errors, status: :unprocessable_entity }
      end
    end
  end
  #
  # # DELETE /schools/1
  # # DELETE /schools/1.json
  def destroy
    @school.destroy
    respond_to do |format|
      format.html { redirect_to schools_url, notice: 'School was successfully destroyed.' }
      format.json { head :no_content }
    end
  end
  #
  private
    # Use callbacks to share common setup or constraints between actions.
    def set_school
      @school = School.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def school_params
      params.require(:school).permit(:name, :school_type, :status, :open_date, :postcode, :email, :exam_board_id)
    end
end
