class MessagesController < ApplicationController
   before_action do
     @offer = Offer.find(params[:offer_id])
    end

  def index
    @messages = @offer.messages
    if @messages.length > 10
      @over_ten = true
      @messages = @messages[-10..-1]
    end
    if params[:m]
      @over_ten = false
      @messages = @offer.messages
    end
    if @messages.last
      if @messages.last.user_id != current_user.id
        @messages.last.read = true;
      end
    end
    @message = Message.new(offer: @offer)
  end

  def new
    @message = Message.new(offer: @offer)

  end

  def create
    @message = @offer.messages.new(message_params)
    @message.user_id = current_user.id
    if @message.save
      redirect_to offer_messages_path(@offer)
    end
  end

  private

  def message_params
    params.require(:message).permit(:content, :user_id)
  end
end
