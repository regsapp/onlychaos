class MessagesController < ApplicationController
  before_action :set_message, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!
  load_and_authorize_resource param_method: :messages_params

  # GET /messages
  # GET /messages.json
  def index
    @messages = Message.all if current_user.admin?
    @messages = Message.where(email: current_user.email) unless current_user.admin?
  end

  # GET /messages/1
  # GET /messages/1.json
  def show
  end

  # GET /messages/new
  def new
    @message = Message.new()

    if params[:disagree] && params[:question_id]
      question = Question.find(params[:question_id])
      @message.title = "I disagree on with this question"
    end
  end

  # POST /messages
  # POST /messages.json
  def create
    @message = Message.new(message_params)

    if current_user
      @message.email = current_user.email
      @message.first_name = current_user.first_name
      @message.last_name  = current_user.last_name
    end

    respond_to do |format|
      if @message.save
        format.html { redirect_to :back, notice: 'Your message has been sent successfully.' }
        # format.json { render :show, status: :created, location: @message }
        format.json { head :no_content }
      else
        format.html { render :new }
        format.json { render json: @message.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /messages/1
  # DELETE /messages/1.json
  def destroy
    @message.destroy
    respond_to do |format|
      format.html { redirect_to messages_url, notice: 'Message was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_message
      @message = Message.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def message_params
      params.require(:message).permit(:email, :first_name, :last_name, :title, :body)
    end
end
