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
    render json: @feedback
  end

  def money_problem
    @feedback = Feedback.new
    raise 'no code' if params[:code] == nil
    @user_code = params[:code]
    @category = MP
  end

  def game_problem
    @feedback = Feedback.new
    raise 'no code' if params[:code] == nil
    @user_code = params[:code]
    @category = GP
  end

  def game_suggestion
    @feedback = Feedback.new
    raise 'no code' if params[:code] == nil
    @user_code = params[:code]
    @category = GS
  end

  private
  def feedback_params
    params.require(:feedback).permit(:id, :user_code, :content, :email, :bug_happen, :avatar, :created_at)
  end

end