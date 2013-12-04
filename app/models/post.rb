class Post < ActiveRecord::Base
  belongs_to :user
  belongs_to :project

  default_scope -> { order('created_at DESC') }

  validates :user_id, presence: true
  validates :project_id, presence: true
  validates :content, presence: true, length: { maximum: 1000 }
end
