class User < ApplicationRecord
  has_secure_password
  validates :username, presence: true
  #validates :password, presence: true
  #validates :username, uniqueness: true


  has_many :users_wines
  has_many :wines, through: :users_wines

  has_many :ratings



  def self.find_or_create_by_omniauth(auth)
    self.where(:username => auth[:info][:nickname]).first_or_create do |user|
      user.password = SecureRandom.hex
    end
  end

end
