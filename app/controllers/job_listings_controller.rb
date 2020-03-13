class JobListingsController < ApplicationController
  before_action :authenticate_user!

  def index
    @job_listings = JobListing.all
  end

  def new
    @job_listing = JobListing.new
  end

  def create
    @job_listing = JobListing.new(job_listing_params)
    if @job_listing.save
      redirect_to root_path
    else
      render :new
    end
  end

  private

  def job_listing_params
    params.require(:job_listing).permit(:title, :description, :address, :category_ids, photos:[])
  end
end
