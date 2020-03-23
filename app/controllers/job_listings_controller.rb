class JobListingsController < ApplicationController
  before_action :authenticate_user!

  def index
    @job_listings = JobListing.all
  end

  def show
    @job_listing = JobListing.find(params[:id])
    @markers =
      [{
        lat: @job_listing.latitude,
        lng: @job_listing.longitude
      }]
  end

  def new
    @job_listing = JobListing.new
  end

  def create
    @job_listing = JobListing.new(job_listing_params)
    @job_listing.user = current_user
    if @job_listing.save
      redirect_to user_dashboard_path, notice: 'Your listing was successfully created!'
    else
      render :new
    end
  end

  def edit
    @job_listing = JobListing.find(params[:id])
  end

  def update
    @job_listing = JobListing.find(params[:id])
    if @job_listing.update(job_listing_params)
      redirect_to user_dashboard_path, notice: 'Your listing was successfully updated.'
    else
      render :edit
    end
  end

   def destroy
    @job_listing = JobListing.find(params[:id])
    @job_listing.destroy
    redirect_to user_dashboard_path, notice: 'Your listing was successfully deleted.'
  end

  private

  def job_listing_params
    params.require(:job_listing).permit(:title, :description, :address, :category_ids, photos:[])
  end
end
