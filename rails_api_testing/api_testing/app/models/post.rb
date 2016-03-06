class Post < ActiveRecord::Base
  belongs_to :user
  validates :body, :author, :user_id, presence: true
end
