class Wine < ApplicationRecord
  #belongs_to :user
  has_many :users_wines
  has_many :users, through: :users_wines
  #
  has_many :ratings

  accepts_nested_attributes_for :users_wines
  #accepts_nested_attributes_for :ratings

  validates_uniqueness_of :name

  def self.find_rating(wine_id, user_id)
    if Rating.find_by(wine_id: wine_id, user_id: user_id).nil?
      return "No ratings..."
    else
      Rating.find_by(wine_id: wine_id, user_id: user_id).id
    end

  end

  def ratings_attributes=(ratings_hash)
    ratings.build(star: ratings_hash[:star], user: ratings_hash[:user])
  end

  def self.top_rated_wines
   Rating.all.where("star >= 90").limit(25)
 end


end
