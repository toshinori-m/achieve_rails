class ReportsController < ApplicationController
  before_action :authenticate_user!

  def create
    reports = Report.new(report: params[:report], point: params[:point], location: params[:location], time: params[:time], condition: params[:condition], intensity: params[:intensity], user_id: current_user.id)
    if reports.save
      render json: { id: reports.id, message: '成功しました' }, status: :ok
    else
      render json: { message: '保存出来ませんでした', errors: reports.errors.messages }, status: :bad_request
    end
  end

  def index
    reports = Report.where("user_id = #{current_user.id}").order(id: "ASC").last(10)
    reports_array = reports.map do |report|
      {
        id: report.id,
        user_id: report.user_id,
        name: report.user.name,
        aim: report.aim,
        email: report.user.email,
        created_at: report.created_at
      }
    end
    render json: reports_array, status: 200
  end

  private
  def reports_params
    params.require(:report).permit(:location, :time, :condition, :intensity, :point, :report, :datepicker_value)
  end
end
