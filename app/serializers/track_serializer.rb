class TrackSerializer < ActiveModel::Serializer
  include Rails.application.routes.url_helpers
  attributes :id, :name, :artist, :year, :public, :category_id, :image, :audio

  belongs_to :category

  def image
    rails_blob_path(object.image, only_path: true) if object.image.attached?
  end

  def audio
    rails_blob_path(object.audio, only_path: true) if object.audio.attached?
  end
end
