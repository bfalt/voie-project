class MessagesController < ApplicationController
   before_action do
   @offer = offer.find(params[:offer_id])
  end

  def new
    @message = @offer.messages.new

  end

  def create
    @message = @offer.messages.new(message_params)
    @message.user_id = current_user.id
    if @message.save
      respond_to do |format|
        format.html { redirect_to offer_path(@offer) } # fallback for certain browsers
        format.js  # <-- will render `app/views/messages/create.js.erb`
      end
    else
      respond_to do |format|
        format.html { redirect_to offer_path(@offer) }
        format.js  # <-- will render `app/views/messages/create.js.erb`
      end
    end
  end

  private

  def message_params
    params.require(:message).permit(:body)
  end
end
