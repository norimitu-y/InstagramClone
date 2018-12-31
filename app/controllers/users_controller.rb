class UsersController < ApplicationController

  before_action :set_user, only:[:show, :edit, :update]
  before_action :edit_user, only:[:edit]

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to user_path(@user.id)
    else
      render "new"
    end
  end

  def show
  end

  def edit
  end

  def update
    if @user.update(user_params)
      redirect_to user_path(@user.id), notice: "ユーザー情報を編集しました！"
    else
      render "edit"
    end
  end


  private

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation, :image, :image_cache)
  end

  def set_user
    @user = User.find(params[:id])
  end

  def edit_user
    unless @user.id == current_user.id
      render "show", notice: "編集できません！"
    end
  end    
end