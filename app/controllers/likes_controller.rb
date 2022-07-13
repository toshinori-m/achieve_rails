class LikesController < ApplicationController
  before_action :authenticate_user!, only: ['create']

  def create
    like = Like.new(message_id: params[:id], user_id: current_user.id)

    if like.save
<<<<<<< HEAD
      render json: { id: like.id, email: current_user.email, message: '成功しました' }, status: 200
    else
      render json: { message: '保存出来ませんでした', errors: like.errors.messages }, status: 400
=======
      render json: { id: like.id, email: current_user.email, message: '成功しました' }, status: :ok
    else
      render json: { message: '保存出来ませんでした', errors: like.errors.messages }, status: :bad_request
>>>>>>> refs/remotes/origin/master
    end
  end
  
  def destroy
    like = Like.find(params[:id])

    if like.destroy
<<<<<<< HEAD
      render json: { id: like.id, email: like.user.email, message: '削除に成功しました' }, status: 200
    else
      render json: { message: '削除できませんでした', errors: like.errors.messages }, status: 400
=======
      render json: { id: like.id, email: like.user.email, message: '削除に成功しました' }, status: :ok
    else
      render json: { message: '削除できませんでした', errors: like.errors.messages }, status: :bad_request
>>>>>>> refs/remotes/origin/master
    end
  end
end
