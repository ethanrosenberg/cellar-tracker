class RatingsController < ApplicationController

  before_action :authenticate_user!, except: :top_rated

  def show
    #@rating = User.ratings.find_by(wine_id: params[:wine_id])
    @rating = Rating.find_by(id: params[:id])
    @wine = Wine.find_by(id: params[:wine_id])
    #binding.pry
  end

  def new
    #binding.pry
    @rating = Rating.new
    #@wine = Wine.
  end

  def top_rated

    #@test = Rating.select(:star).map(&:star).uniq

    #@test = Rating.all.line_items.group(:wine_id).count
    #@test2 = Rating.group(:wine_id).group(:star)

    #@ratings = Rating.distinct.pluck(:wine_id)
    #binding.pry

    @wine_ratings = Wine.top_rated_wines


    #@wine_ids.each do |wine_id|
    #  Wine.find_by(id: wine_id).
    #end

    #binding.pry

    #quick hack to get working for now and then will refactor with some rails magic.
    #@ratings = Rating.all
    #@average_ratings = {}

    #@ratings.each do |rating|
      #@average_ratings[rating.wine_id] ||= {}
    #  @average_ratings[rating.wine_id] += rating.star.to_i
    #end

    #@occurences = Rating.all.each_with_object(Hash.new(0)) { |name, hash| hash[name] += 1 }

    #binding.pry

    #@average_ratings.each do |rating_total|

  #  end

  #  binding.pry


  end
end
