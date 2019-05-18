class WineSerializer < ActiveModel::Serializer
  attributes :id, :name, :vintage
end
