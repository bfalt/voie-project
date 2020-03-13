class JobListing < ApplicationRecord
  belongs_to :user
  has_many :job_listing_categories
  has_many :services, through: :job_listing_categories
  has_many_attached :photos

  # geocoded_by :address, if: :will_save_change_to_address?
  # after_validation :geocode

  validates :title, presence: true
  validates :description, presence: true
  validates :address, presence: true
end
