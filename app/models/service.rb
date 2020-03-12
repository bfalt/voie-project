class Service < ApplicationRecord
  has_many :job_listing_categories
  has_many :job_listings, through: :job_listing_categories
  def self.formatted_selection
    # [["TEXT", "ID"]]
    Service.all.map { |service| [service.category, service.id] }
  end
end
