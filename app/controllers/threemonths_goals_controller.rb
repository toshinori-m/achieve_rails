class ThreemonthsGoalsController < ApplicationController
  before_action :authenticate_user!

  def create
    threemonths_goals_params = ThreemonthsGoal.new(threemonths_goals_params)
    threemonths_goals = threemonths_goals_params
    threemonths_goals.user = current_user
    threemonths_goals.aim = params[:aim]
    if threemonths_goals.save
      render json: { id: threemonths_goals.id, message: '成功しました' }, status: :ok
    else
      render json: { message: '保存出来ませんでした', errors: threemonths_goals.errors.messages }, status: :bad_request
    end
  end


  def index
    threemonths_goals = ThreemonthsGoal.all
    threemonths_goals_array = threemonths_goals.map do |threemonths_goal|
      {
        id: threemonths_goal.id,
        user_id: threemonths_goal.user.id,
        name: threemonths_goal.user.name,
        aim: threemonths_goal.aim,
        quarter: threemonths_goal.quarter,
        email: threemonths_goal.user.email,
        created_at: threemonths_goal.created_at
      }
    end
    render json: threemonths_goals_array, status: 200
  end

  private
  def threemonths_goals_params
    params.require(:threemonths_goal).permit(:aim)
  end
end
