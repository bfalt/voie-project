class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home ]

  def home
  end

  def user_dashboard
    @job_listings = JobListing.where(user: current_user)
  end

  def agent_dashboard
    @offers = Offer.where(agent: current_user.agent)
  end
end
