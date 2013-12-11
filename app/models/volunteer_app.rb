class VolunteerApp < ActiveRecord::Base
  belongs_to :user

  validates :user_id, presence: true
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :skype_name, presence: true

  VALID_PHONE_NUMBER_REGEX = /\A(?:(?:\+?1\s*(?:[.-]\s*)?)?(?:(\s*([2-9]1[02-9]|[2-9][02-8]1|[2-9][02-8][02-9]‌​)\s*)|([2-9]1[02-9]|[2-9][02-8]1|[2-9][02-8][02-9]))\s*(?:[.-]\s*)?)?([2-9]1[02-‌​9]|[2-9][02-9]1|[2-9][02-9]{2})\s*(?:[.-]\s*)?([0-9]{4})\z/  
  validates :phone_number, presence: true, format: { with: VALID_PHONE_NUMBER_REGEX } 
 
  validates :birth_date, presence: true
  validates :gender, presence: true

  VALID_LINKEDIN_REGEX = /\A(http:\/\/.+\.linkedin.com\/(pub|in).*)?\z/
  validates :linked_in, format: { with: VALID_LINKEDIN_REGEX }

  VALID_STREET_ADDRESS_REGEX = /\A(\d{1,6}\040([A-Z]{1}[a-z]{1,}\040[A-Z]{1}[a-z]{1,})$|^\d{1,6}\040([A-Z]{1}[a-z]{1,}\040[A-Z]{1}[a-z]{1,}\040[A-Z]{1}[a-z]{1,})$|^\d{1,6}\040([A-Z]{1}[a-z]{1,}\040[A-Z]{1}[a-z]{1,}\040[A-Z]{1}[a-z]{1,}\040[A-Z]{1}[a-z]{1,}))?\z/
  validates :street_address, presence: true, format: { with: VALID_STREET_ADDRESS_REGEX }

  validates :city, presence: true
  validates :state, presence: true

  VALID_ZIP_CODE_REGEX = /\A(\d{5}(-\d{4})?)?\z/
  validates :zip, presence: true, format: { with: VALID_ZIP_CODE_REGEX }

  validates :country, presence: true
  validates :citizenship_country, presence: true

  validates :street_address_home, format: { with: VALID_STREET_ADDRESS_REGEX }
  validates :zip_home, format: { with: VALID_ZIP_CODE_REGEX }

  validates :spanish_learned, presence: true
  validates :convicted, presence: true
  validates :visa_denied, presence: true

end
