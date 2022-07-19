class ThreemonthsGoalsController < ApplicationController
  before_action :authenticate_user!

  def new
    form = Form::ThreemonthsGoalCollection.new
  end

  def create
    quarter_0 = ThreemonthsGoal.new(aim:params[:form_threemonths_goal_collection][:aim_1], quarter: 0,user_id: current_user.id)
    quarter_1 = ThreemonthsGoal.new(aim:params[:form_threemonths_goal_collection][:aim_2], quarter: 1,user_id: current_user.id)
    quarter_2 = ThreemonthsGoal.new(aim:params[:form_threemonths_goal_collection][:aim_3], quarter: 2,user_id: current_user.id)
    quarter_3 = ThreemonthsGoal.new(aim:params[:form_threemonths_goal_collection][:aim_4], quarter: 3,user_id: current_user.id)
    if quarter_0.save && quarter_1.save && quarter_2.save && quarter_3.save
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
  def threemonths_goal_collection_params
    params
      .require(:form_threemonths_goal_collection)
      .permit(:aim_1, :aim_2, :aim_3, :aim_4)
  end
end
