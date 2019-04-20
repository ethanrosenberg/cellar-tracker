class WinesController < ApplicationController
  before_action :authenticate_user!
  before_action :find_wine, only: [:show, :edit, :update, :destroy]

  def index
    #binding.pry
    @wines = current_user.wines
    #
  end

  def show

  end

  def wine_library
    @wine_library = Wine.all
    render 'library'
    #binding.pry
  end

  def new
    @wine = Wine.new

  end

  def create

    @wine = Wine.create(wine_params(:name, :vintage))
    @wine.users << current_user unless @wine.users.include?(current_user)
    #binding.pry
    @rating = Rating.new(star: wine_params(:ratings)[:ratings])
    @rating.wine_id = @wine.id
    @rating.user_id = current_user.id
    @rating.save
    @wine.ratings << @rating


    if @wine.save
      redirect_to @wine, notice: "Successfully added a new wine!"
    else
      render 'new'
    end
  end

  private

  def wine_params(*args)
    params.require(:wine).permit(*args)
    #params.require(:wine).permit(:name, :vintage, :rating)

  end

  def find_wine
    @wine = Wine.find(params[:id])
  end
end
