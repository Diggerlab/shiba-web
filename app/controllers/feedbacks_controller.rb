class FeedbacksController < ApplicationController
  MP ='money_problem'
  GP = 'game_problem'
  GS = 'game_suggestion'
  def new
    @feedback = Feedback.new
  end

  def show
    
  end

  def create
    @feedback = Feedback.create!(feedback_params)
    @upload = @feedback.uploads.create!(feedback_uploads)
    render json: @feedback
  end

  def money_problem
    @feedback = Feedback.new
    raise 'no uid' if params[:uid] == nil
    @user_code = params[:uid]
    @category = MP
  end

  def game_problem
    @feedback = Feedback.new
    raise 'no uid' if params[:uid] == nil
    @user_code = params[:uid]
    @category = GP
  end

  def game_suggestion
    @feedback = Feedback.new
    raise 'no uid' if params[:uid] == nil
    @user_code = params[:uid]
    @category = GS
  end

  private
  def feedback_params
    params.require(:feedback).permit(:uid, :content, :email, :error_reported_at, :order_paid_at, :order_note, :order_number, :created_at)
  end

  def feedback_uploads
    params.require(:feedback).permit(:feedback_id, :avatar, :created_at)
  end

end