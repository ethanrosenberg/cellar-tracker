class RatingSerializer < ActiveModel::Serializer
  attributes :id, :star
  belongs_to :wine
end
