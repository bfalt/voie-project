class JobListingCategory < ApplicationRecord
  belongs_to :job_listing
  belongs_to :service
end
