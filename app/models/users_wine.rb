class UsersWine < ApplicationRecord
self.primary_key = :user_id
  belongs_to :user
  belongs_to :wine

  def self.find_date_purchased(wine, current_user)

    purchased = self.where(user_id: current_user.id, wine_id: wine.id).last.purchase_date.strftime("%B %e, %Y")
    if purchased
      purchased
    else
      "No Purchase Date Added..."
    end

    #.nil? ? "No Purchase Date" : self.find_by(user_id: current_user.id, wine_id: wine).purchase_date.nil?
  end

  def users_wines_attributes=(users_wines_hash)
    users_wines.new(purchase_date: users_wines_hash[:purchase_date], user: users_wines_hash[:user])
  end




end
