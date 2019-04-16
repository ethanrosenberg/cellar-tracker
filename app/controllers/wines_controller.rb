class WinesController < ApplicationController
  before_action :find_wine, only: [:show, :edit, :update, :destroy]

  def index
    @wines = Wine.all
  end

  def show

  end

  def new
    @wine = Wine.new

  end

  def create
    @wine = Wine.new(wine_params)

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
