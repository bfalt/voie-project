class Offer < ApplicationRecord
  belongs_to :job_listing
  belongs_to :agent
  has_many :reviews
  has_many :messages, dependent: :destroy

  validates_uniqueness_of :job_listing_id, :scope => :agent_id

  after_update :check_offers_status

  def check_offers_status
    just_updated_offer = self
    if just_updated_offer.status == 'accepted'
      job_listing = just_updated_offer.job_listing
      offers = job_listing.offers.where(status: 'pending')
      offers.each { |offer| offer.update(status: 'rejected')}
    end
  end

end
