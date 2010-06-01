class MessagesController < ApplicationController
  
  def create
    @message = Message.new(params[:message])
    if @message.save
      flash[:notice] = "Your Message Was Sent"
      redirect_to @message.conversation.path
    else
      render 'send_error'
    end
  end
end
