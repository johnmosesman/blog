class Api::PostsSerializer < ActiveModel::Serializer
  attributes :id, :body, :author, :user_id
end
