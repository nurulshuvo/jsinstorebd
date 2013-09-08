class MessagesController < ApplicationController
  def index
    @messages = current_user.received_messages
  end

  def outbox
    @messages = current_user.sent_messages
  end

  def show
    # @message = current_user.messages.find(params[:id])
    @message = current_user.received_messages.find(params[:id])
  end

  def destroy
    # @message = current_user.messages.find(params[:id])
    @message = current_user.received_messages.find(params[:id])
    if @message.destroy
      flash[:notice] = "Message Deleted"
      redirect_to user_path(current_user)
    else
      flash[:error] = "Fail"
      redirect_to user_path(current_user)
    end
  end

  def new
    # raise params.inspect
    @message = ActsAsMessageable::Message.new
  end

  def create
    # raise params[:inspect]
    @to = User.find_by_email(params[:acts_as_messageable_message][:to])
    current_user.send_message(@to, params[:message][:topic], params[:message][:body])
    redirect_to message_path
  end
end
