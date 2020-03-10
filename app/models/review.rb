class Review < ApplicationRecord
  belongs_to :offer

  validates :comment, length: { minimum: 10 }
  validates :star, inclusion: { in: [1, 2, 3, 4, 5] }

  def author
    offer.job_listing.user
  end
end
