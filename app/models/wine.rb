class Wine < ApplicationRecord
  #belongs_to :user
  has_many :users_wines
  has_many :users, through: :users_wines
  #
  has_many :ratings


end
