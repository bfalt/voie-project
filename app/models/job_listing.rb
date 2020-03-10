class JobListing < ApplicationRecord
  belongs_to :user
  has_many_attached :photos

  validates :title, presence: true
  validates :description, presence: true
  validates :address, presence: true
end
