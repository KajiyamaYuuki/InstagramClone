class FavoritesController < ApplicationController
  def index
    favorites = Favorite.includes(:picture).where(user_id: params[:user_id])
    @user = User.find(params[:user_id])
    @pictures = favorites.map(&:picture)

    # # GOAL
    # [<favorite picutre=<picture>>, <favorite picutre=<picture>>, <favorite picutre=<picture>>]
    # [<picutre>, <picutre>, <picutre>]

    # # 1
    # @pictures = []
    # favorites.each do |f|
    #   @pictures << f.picture
    # end

    # # 2
    # @pictures = []
    # favorites.each { |f| @pictures << f.picture }

    # # 3
    # @pictures = favorites.map { |f| f.picture }

    # # 4
    # @pictures = favorites.map(&:picture)
  end

  def create
    favorite = current_user.favorites.build(picture_id: params[:picture_id])
    favorite.save
    redirect_to picture_path(Picture.find(params[:picture_id]))
  end

  def destroy
    favorite = Favorite.find_by(picture_id: params[:picture_id], user_id: current_user.id)
    favorite.destroy
    redirect_to picture_path(Picture.find(params[:picture_id]))
  end
end
