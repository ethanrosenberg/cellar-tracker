class RatingsController < ApplicationController

  before_action :authenticate_user!, except: :highest_rated

  def show

    @rating = Rating.find_by(id: params[:id], wine_id: params[:wine_id])

    #binding.pry

  end
end
