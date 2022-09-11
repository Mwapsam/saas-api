class Category < ApplicationRecord
    has_many :tracks

    has_one_attached :image

    validates :name, :decription, presence: true
end
