class Wine < ApplicationRecord
  #belongs_to :user
  has_many :users_wines
  has_many :users, through: :users_wines
  #
  has_many :ratings
  accepts_nested_attributes_for :users_wines

  


end
