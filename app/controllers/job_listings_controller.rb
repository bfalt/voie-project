class JobListingsController < ApplicationController
  before_action :authenticate_user!

  def index
    @job_listings = JobListing.all
  end

  def show
    @job_listings = JobListing.geocoded #returns flats with coordinates

    @markers = @job_listings.map do |job_listing|
      {
        lat: job_listing.latitude,
        lng: job_listing.longitude
      }
    end
  end

  def new
    @job_listing = JobListing.new
  end

  def create
    @job_listing = JobListing.new(job_listing_params)
    @job_listing.user =  current_user
    if @job_listing.save
      redirect_to user_dashboard_path
    else
      render :new
    end
  end

  private

  def job_listing_params
    params.require(:job_listing).permit(:title, :description, :address, :category_ids, photos:[])
  end
end
