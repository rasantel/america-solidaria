class User < ActiveRecord::Base
	before_save { self.email = email.downcase }
	before_create :create_remember_token
	validates :name, presence: true, length: { maximum: 50 }
	VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i
	validates :email, presence: true, format: { with: VALID_EMAIL_REGEX }, uniqueness: { case_sensitive: false }
	validates :password, length: { minimum: 6 }
	has_secure_password

        has_one :volunteer_app, dependent: :destroy
        has_one :skill, dependent: :destroy        

        has_many :memberships, :dependent => :destroy
        has_many :requests, :dependent => :destroy
        has_many :projects, :through => :memberships
        has_many :posts, dependent: :destroy

	accepts_nested_attributes_for :volunteer_app

	def User.new_remember_token
		SecureRandom.urlsafe_base64
	end

	def User.encrypt(token)
		Digest::SHA1.hexdigest(token.to_s)
	end

	private

	def create_remember_token
		self.remember_token = User.encrypt(User.new_remember_token)
	end
end
