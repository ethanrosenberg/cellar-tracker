class RatingSerializer < ActiveModel::Serializer
  attributes :id, :star, :note, :updated_at
  belongs_to :wine
end
