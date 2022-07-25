class GoalsController < ApplicationController
  before_action :authenticate_user!

  def create
    goals_params = Goal.new(goals_params)
    goals = goals_params
    goals.user = current_user
    goals.aim = params[:aim]
    if goals.save
      render json: { id: goals.id, message: '成功しました' }, status: :ok
    else
      render json: { message: '保存出来ませんでした', errors: goals.errors.messages }, status: :bad_request
    end
  end

  def index
    # goals = Goal.order(:user_id ).last(1)
    goals = Goal.all
    goals_array = goals.map do |goal|
      {
        id: goal.id,
        user_id: goal.user_id,
        name: goal.user.name,
        aim: goal.aim,
        email: goal.user.email,
        created_at: goal.created_at
      }
    end
    render json: goals_array, status: 200
  end

  private
  def goals_params
    params.require(:goal).permit(:aim)
  end
end
