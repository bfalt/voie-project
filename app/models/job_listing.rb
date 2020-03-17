class JobListing < ApplicationRecord
  belongs_to :user
  has_many :job_listing_categories, dependent: :destroy
  has_many :offers, dependent: :destroy
  has_many :services, through: :job_listing_categories
  has_many_attached :photos

  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?

  validates :title, presence: true
  validates :description, presence: true
  validates :address, presence: true
end
