class Admin::GenresController < ApplicationController

  # before_action :authenticate_admin!

  def index
    @genre = Genre.new
    @genres = Genre.page(params[:page])
  end

  def create
    @genre = Genre.new(genre_params)
    @genres = Genre.page(params[:page])
    if  @genre.save
      flash[:success] = "ジャンル名が新規登録されました"
      redirect_to admin_genres_path
    else
      flash.now[:danger] = "全て入力してください"
      render :index
    end
  end

  def edit
    @genre = Genre.find(params[:id])
  end

  def update
    @genre = Genre.find(params[:id])
    if  @genre.update(genre_params)
      flash[:warning] = 'ジャンル名が更新されました'
      redirect_to admin_genres_path
    else
      flash.now[:danger] = "全て入力してください"
      render :edit
    end
  end

  private

  def genre_params
    params.require(:genre).permit(:name)
  end
end
