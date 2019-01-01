class PicturesController < ApplicationController

  before_action :set_picture, only:[:show, :edit, :update, :destroy]
  before_action :login, only:[:index, :new, :edit, :show, :destroy]
  before_action :edit_picture, only:[:edit]

  def index
    @pictures = Picture.all
    #@favorites = current_user.favorites
  end

  def new
    if params[:back]
      @picture = Picture.new(picture_params)
      @picture.user_id = current_user.id
    else
     @picture = Picture.new
   end
  end

  def confirm
    @picture = Picture.new(picture_params)
    @picture.user_id = current_user.id
    render :new if @picture.invalid?
  end

  def create
    @picture = current_user.pictures.build(picture_params)
    if @picture.save
      redirect_to pictures_path, notice: "新しくPostしました！"
    else
      render "new"
    end
  end

  def show
    @user = @picture.user
    @favorite = current_user.favorites.find_by(picture_id: @picture.id)
  end

  def edit
  end

  def update
    if @picture.update(picture_params)
      redirect_to pictures_path, notice: "Postを編集しました！"
    else
      render "edit"
    end
  end

  def destroy
    @picture.destroy
    redirect_to pictures_path, notice: "Postを削除しました！"
  end


  private

  def picture_params
    params.require(:picture).permit(:title, :content, :image, :image_cache)
  end

  def set_picture
    @picture = Picture.find(params[:id])
  end

  def login
    if logged_in?
    else
      redirect_to new_session_path
    end
  end

  def edit_picture
    unless @picture.user_id == current_user.id
      rendr "show", danger: "編集できません。ユーザーを確認して下さい！"
    end
  end

end
