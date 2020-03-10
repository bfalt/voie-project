class OffersController < ApplicationController
  before_action :set_offer, only: [:show]
  def index
    @offers = current_user.offers
  end

  def show
  end

  def new
    @offer = Offer.new
  end

  def create

  end

  def accept
    @offer = Offer.find(params[:offer_id])
    @offer.status = "accepted"
    @offer.save
    redirect_to pages_dashboard_path, notice: "Offer accepted"
  end

  def reject
    @offer = Offer.find(params[:offer_id])
    @offer.status = "rejected"
    @offer.save
    redirect_to pages_dashboard_path, notice: "Offer rejected"
  end

  private

  def offer_params
    params.require(:offer).permit(:status, :price, :completed)
  end

  def set_offer
    @offer = offer.find(params[:id])
  end
end
