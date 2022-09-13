class Track < ApplicationRecord
  belongs_to :category

  has_one_attached :image
  has_one_attached :audio

  validates :name, :artist, presence: true
end
