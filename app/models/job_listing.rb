class JobListing < ApplicationRecord
  belongs_to :user
  has_many :job_listing_categories
  has_many :services, through: :job_listing_categories
  has_many_attached :photos

  validates :title, presence: true
  validates :description, presence: true
  validates :address, presence: true
end
