class Rating < ApplicationRecord
  belongs_to :user
  belongs_to :wine

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

#def star
#  star
#end

#def star=(star)
  #star.to_i
#nd


end
