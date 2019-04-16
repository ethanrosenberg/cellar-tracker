class WinesController < ApplicationController
  before_action :find_wine, only: [:show, :edit, :update, :destroy]
  
  def index
  end

  def show

  end

  def new

  end

  def create

  end

  private

  def find_wine
    @wine = Wine.find(params[:id])
  end
end
