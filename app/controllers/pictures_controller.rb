class PicturesController < ApplicationController
  before_action :set_picture, only: [:show, :edit, :update, :destroy]
  def index
    @picture = Picture.all
  end

  def new
    @picture = Picture.new
  end

  def create
    @picture =current_user.pictures.build(picture_params)
    if params[:back]
      render :new
    else
      if @picture.save
        redirect_to user_path(current_user.id), notice: "投稿が完了しました！"
      else
        render :new
      end
    end
  end

  def show
  end

  def edit

  end

  def update
    if @picture.update
      redirect_to picture_path(@picture.id), notice: "投稿内容を編集しました"
    else
      render :edit
    end
  end

  def destroy
    @picture.destroy
    redirect_to user_path(current_user.id), notice:"投稿を削除しました"
  end

  def confirm
    @picture =current_user.pictures.build(picture_params)
    render :new if @picture.invalid?
  end

  private
  def picture_params
    params.require(:picture).permit(:image, :image_cache, :content)
  end

  def set_picture
    @picture = Picture.find(params[:id])
  end
end
