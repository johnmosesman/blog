class Api::PostsSerializer < ActiveModel::Serializer
  attributes :id, :body, :author
end
