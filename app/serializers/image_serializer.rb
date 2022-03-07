class ImageSerializer
  include JSONAPI::Serializer
  set_id :id
  set_type :image
  attributes :url, :photographer, :photographer_url
end
