class Project < ActiveRecord::Base
  has_many :memberships, :dependent => :destroy
  has_many :users, :through => :memberships
  has_many :posts

  validates :name, presence: true, length: { maximum: 100 }
  validates :description, presence: true
  validates :admin_id, presence: true
end
