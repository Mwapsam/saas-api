class CategorySerializer < ActiveModel::Serializer
  include Rails.application.routes.url_helpers
  attributes :id, :name, :decription, :image

  has_many :tracks

  def image
    rails_blob_path(object.image, only_path: true) if object.image.attached?
  end
end
