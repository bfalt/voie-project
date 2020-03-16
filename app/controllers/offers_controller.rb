class OffersController < ApplicationController
  before_action :set_offer, only: [:show]
  before_action :authenticate_user!
  def index
    @offers = current_user.offers
  end

  def show
  end

  def new
    @offer = Offer.new
  end

  def create
    @offer = Offer.new(offer_params)
    @offer.agent =  current_user.agent
    @job_listing = JobListing.find(params[:job_listing_id])
    @offer.job_listing = @job_listing
    if @offer.save
      redirect_to agent_dashboard_path
    else
      render 'job_listings/index'
    end
  end

  def accept
    @offer = Offer.find(params[:id])
    @offer.status = "accepted"
    @offer.save
    redirect_to user_dashboard_path, notice: "Offer accepted"
  end

  def reject
    @offer = Offer.find(params[:id])
    @offer.status = "rejected"
    @offer.save
    redirect_to user_dashboard_path, notice: "Offer rejected"
  end

  def complete
    @offer = Offer.find(params[:id])
    @offer.status = "completed"
    @offer.save
    redirect_to agent_dashboard_path, notice: "Offer completed"
  end

  private

  def offer_params
    params.require(:offer).permit(:status, :price, :completed)
  end

  def set_offer
    @offer = offer.find(params[:id])
  end
end
