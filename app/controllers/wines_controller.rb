class WinesController < ApplicationController
  before_action :authenticate_user!
  before_action :find_wine, only: [:show, :edit, :update, :destroy]

  def index
    @wines = User.find_by(id: current_user.id).wines
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
    #puts wine_params
    #@rating = Rating.create(star: wine_params[:rating])
    @wine = Wine.new(wine_params)
    @wine.users << current_user
    #@wine.rating = @rating
    #binding.pry
    #@wine.user = current_user

    if @wine.save
      redirect_to @wine, notice: "Successfully added a new wine!"
    else
      render 'new'
    end
  end

  private

  def wine_params
    params.require(:wine).permit(:name, :vintage)
  end

  def find_wine
    @wine = Wine.find(params[:id])
  end
end
