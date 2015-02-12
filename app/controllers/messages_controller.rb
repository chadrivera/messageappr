class MessagesController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  def show
    @messages = Message.order('created_at desc').all
    render layout:"application"
  end

  def create
    save = Message.new
    save.messages = params["newmessage"]
    save.username = params["name"]

    # if session[:messages]
    #   1
    # else
    #   session[:messages] = []
    # end

    save.save
    #always redirect after post
    #render "messages/index"
    redirect_to "/messages"
  end
end
