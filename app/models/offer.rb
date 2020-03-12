class Offer < ApplicationRecord
  belongs_to :job_listing
  belongs_to :agent
  has_many :reviews
  has_many :messages
end
