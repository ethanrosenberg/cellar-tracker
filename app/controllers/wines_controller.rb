class WinesController < ApplicationController
  before_action :authenticate_user!
  before_action :find_wine, only: [:show, :edit, :update, :destroy]

  def index
    @wines = current_user.wines
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
    @wine = Wine.create(wine_params)
    @wine.users << current_user unless @wine.users.include?(current_user)
    binding.pry

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
