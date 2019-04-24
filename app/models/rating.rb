class Rating < ApplicationRecord
  belongs_to :user
  belongs_to :wine

  #testing

def self.get_rating(wine, current_user)
  binding.pry
    @rating = self.find_by(wine_id: wine.id, user_id: current_user)
  if @rating.nil?
    0
  else
    @rating.to_i
  end

end

end
