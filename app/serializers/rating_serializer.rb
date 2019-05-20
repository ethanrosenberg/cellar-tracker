class RatingSerializer < ActiveModel::Serializer
  attributes :id, :star, :note
  belongs_to :wine
end
