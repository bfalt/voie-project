class ServicesController < ApplicationController
  def index
    @services = Service.all
    @job_listing = JobListing.new
  end
end
