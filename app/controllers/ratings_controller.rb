class RatingsController < ApplicationController

  before_action :authenticate_user!, except: :highest_rated

  def show

    #binding.pry
    #@rating = User.ratings.find_by(wine_id: params[:wine_id])
    @rating = Rating.find_by(wine_id: params[:wine_id], id: params[:id])
    @wine = Wine.find_by(id: params[:wine_id])



    #binding.pry

  end
end
