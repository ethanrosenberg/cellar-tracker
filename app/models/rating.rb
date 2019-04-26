class Rating < ApplicationRecord
  belongs_to :user
  belongs_to :wine

  scope :top_rated, -> { where("star > 90") }

  #testing

def self.get_rating(wine, current_user)
    rating = self.find_by(wine_id: wine.id, user_id: current_user)
    #binding.pry
  if rating.nil?
    return 0
  else
    return rating.star.to_i
  end

end

def self.get_average_wine_ratings(wine_ratings_arr)
  sum = 0
  wine_ratings_arr.each do |rating|
    sum += rating
  end
#binding.pry
  sum / wine_ratings_arr.size
end

end
