class UsersWine < ApplicationRecord
  belongs_to :user
  belongs_to :wine

  def purchased
  purchase_date.strftime("%A, %B %e")
  end

end
