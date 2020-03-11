class JobListingsController < ApplicationController
  def new
    @job_listing = JobListing.new
  end

  def create

  end
end
