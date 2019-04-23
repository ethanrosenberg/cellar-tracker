class UsersWine < ApplicationRecord
  belongs_to :user
  belongs_to :wine

  def self.find_date_purchased(wine, current_user)
    self.where(user_id: current_user.id, wine_id: wine.id).first.purchase_date.strftime("%B %e, %Y") unless self.find_by(user_id: current_user.id, wine_id: wine).purchase_date.nil?
  end



end
