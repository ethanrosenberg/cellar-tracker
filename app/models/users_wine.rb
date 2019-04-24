class UsersWine < ApplicationRecord
self.primary_key = :user_id
  belongs_to :user
  belongs_to :wine

  def self.find_date_purchased(wine, current_user)
    self.where(user_id: current_user.id, wine_id: wine.id).first.purchase_date.strftime("%B %e, %Y") unless self.find_by(user_id: current_user.id, wine_id: wine).purchase_date.nil?
  end

  def users_wines_attributes=(users_wines_hash)
    users_wines.new(purchase_date: users_wines_hash[:purchase_date], user: users_wines_hash[:user])
  end




end
