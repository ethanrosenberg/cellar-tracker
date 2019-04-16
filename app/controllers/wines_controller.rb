class WinesController < ApplicationController
  before_action :find_wine, only: [:show, :edit, :update, :destroy]

  def index
  end

  def show

  end

  def new
    @wine = Wine.new

  end

  def create
    @wine = Wine.new(wine_params)
  end

  private

  def wine_params
    params.require(:wine).permit(:name, :vintage)

  def find_wine
    @wine = Wine.find(params[:id])
  end
end
