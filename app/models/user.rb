class User < ApplicationRecord
  has_secure_password
  has_many :wines

  def self.find_or_create_by_omniauth(auth)
    self.where(:username => auth[:info][:nickname]).first_or_create do |user|
      user.password = SecureRandom.hex
    end
  end

end
