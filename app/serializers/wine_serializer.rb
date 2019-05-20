class WineSerializer < ActiveModel::Serializer
  attributes :id, :name, :vintage
  has_many :ratings
  has_many :users_wines, serializer: PurchaseDateSerializer
end
