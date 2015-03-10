class YearGroupsController < ApplicationController
  before_action :set_year_group, only: [:show, :edit, :update, :destroy]

  # GET /year_groups
  # GET /year_groups.json
  def index
    @year_groups = YearGroup.all
  end

  # GET /year_groups/1
  # GET /year_groups/1.json
  def show
  end

  # GET /year_groups/new
  def new
    @year_group = YearGroup.new
  end

  # GET /year_groups/1/edit
  def edit
  end

  # POST /year_groups
  # POST /year_groups.json
  def create
    @year_group = YearGroup.new(year_group_params)

    respond_to do |format|
      if @year_group.save
        format.html { redirect_to @year_group, notice: 'Year group was successfully created.' }
        format.json { render :show, status: :created, location: @year_group }
      else
        format.html { render :new }
        format.json { render json: @year_group.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /year_groups/1
  # PATCH/PUT /year_groups/1.json
  def update
    respond_to do |format|
      if @year_group.update(year_group_params)
        format.html { redirect_to @year_group, notice: 'Year group was successfully updated.' }
        format.json { render :show, status: :ok, location: @year_group }
      else
        format.html { render :edit }
        format.json { render json: @year_group.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /year_groups/1
  # DELETE /year_groups/1.json
  def destroy
    @year_group.destroy
    respond_to do |format|
      format.html { redirect_to year_groups_url, notice: 'Year group was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_year_group
      @year_group = YearGroup.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def year_group_params
      params.require(:year_group).permit(:name)
    end
end
