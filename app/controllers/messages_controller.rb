class MessagesController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  layout "application"
  def show
    @messages = Message.order('created_at desc').all
    @save = Message.new
    #  layout:"application"
  end

  def create
    @save = Message.new(
      username: params["name"],
      message: params["newmessage"]
    )
    # save.messages = params["newmessage"]
    # save.username = params["name"]

    if(@save.save)
    #always redirect after post
    #render "messages/index"
      redirect_to "/messages"
    else
      #show errors
      render 'show'
    end

  end
end
