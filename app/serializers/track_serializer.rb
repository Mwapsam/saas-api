class TrackSerializer < ActiveModel::Serializer
  attributes :id, :name, :artist, :year, :public, :category_id, :image

  belongs_to :category

  def image
    rails_blob_path(object.image, only_path: true) if object.image.attached?
  end
end
