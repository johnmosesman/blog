class Post < ActiveRecord::Base
  belongs_to :user
  validates :body, :author, :user_id, presence: true

  scope :for_user, -> (user_id) { where(user_id: user_id) }
end
