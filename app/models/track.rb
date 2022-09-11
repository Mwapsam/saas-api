class Track < ApplicationRecord
  belongs_to :category

  has_one_attached :image

  validates :name, :artist, presence: true
end
