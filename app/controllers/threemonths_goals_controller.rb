class ThreemonthsGoalsController < ApplicationController
  before_action :authenticate_user!

  # def new
  #   form = Form::ThreemonthsGoalCollection.new
  # end

  def create
    # threemonths_goals = ThreemonthsGoal.new()
    # threemonths_goals.user = current_user
    # threemonths_goals.aim = params[:aim_1]
    # threemonths_goals.quarter = 1
    # quarter = threemonths_goals

    # quarter = ThreemonthsGoal.new(aim:params[:aim_1], quarter: 1, user_id: current_user.id)

    # quarter_1 = ThreemonthsGoal.new(aim:params[:form_threemonths_goal_collection][:aim_2], quarter: 1,user_id: current_user.id)
    # quarter_2 = ThreemonthsGoal.new(aim:params[:form_threemonths_goal_collection][:aim_3], quarter: 2,user_id: current_user.id)
    # quarter_3 = ThreemonthsGoal.new(aim:params[:form_threemonths_goal_collection][:aim_4], quarter: 3,user_id: current_user.id)

    aims = [params[:aim_1], params[:aim_2], params[:aim_3], params[:aim_4]]
      for i in 1 .. 4 do threemonths_goals_params = ThreemonthsGoal.new(aims, quarter: i, user_id: current_user.id)
        quarter = threemonths_goals_params

      if quarter.save
        render json: { id: threemonths_goals.id, message: '成功しました' }, status: :ok
      else
        render json: { message: '保存出来ませんでした', errors: threemonths_goals.errors.messages }, status: :bad_request
      end
    end
  end

  # def index
  #   threemonths_goals = ThreemonthsGoal.all
  #   threemonths_goals_array = threemonths_goals.map do |threemonths_goal|
  #     {
  #       id: threemonths_goal.id,
  #       user_id: threemonths_goal.user.id,
  #       name: threemonths_goal.user.name,
  #       aim: threemonths_goal.aim,
  #       quarter: threemonths_goal.quarter,
  #       email: threemonths_goal.user.email,
  #       created_at: threemonths_goal.created_at
  #     }
  #   end
  #   render json: threemonths_goals_array, status: 200
  # end

private
  def threemonths_goal_collection_params
    params
      .require(:threemonths_goal)
      .permit(:aim_1,:aim_2,:aim_3,:aim_4)
  end
end
