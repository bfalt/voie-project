class JobListingCategory < ApplicationRecord
  belongs_to :Joblisting
  belongs_to :service
end
