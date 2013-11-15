class VolunteerApp < ActiveRecord::Base
  belongs_to :user

  validates :user_id, presence: true
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :skype_name, presence: true
  VALID_PHONE_NUMBER_REGEX = /\A(?:(?:\+?1\s*(?:[.-]\s*)?)?(?:(\s*([2-9]1[02-9]|[2-9][02-8]1|[2-9][02-8][02-9]‌​)\s*)|([2-9]1[02-9]|[2-9][02-8]1|[2-9][02-8][02-9]))\s*(?:[.-]\s*)?)?([2-9]1[02-‌​9]|[2-9][02-9]1|[2-9][02-9]{2})\s*(?:[.-]\s*)?([0-9]{4})\z/  
  validates :phone_number, presence: true, format: { with: VALID_PHONE_NUMBER_REGEX } 
 

end
