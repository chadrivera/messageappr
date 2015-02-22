class MessagesController < ApplicationController
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  #layout "application"
  def show
    if current_user == nil
      redirect_to '/login'
    elsif session[:channel_id] == '' || session[:channel_id] == nil
      redirect_to '/channel'

    else


      @membership = Membership.find_by_user_id_and_channel_id(current_user.id,
                                                              session[:channel_id])
      unless @membership != nil
        @membership = Membership.new(user_id: current_user.id,
                                     channel_id: session[:channel_id])
        session[:channel_id] = params[:channel_id]

        @membership.save

      end
      @messages = Message.where(membership_id: @membership.id).order('created_at desc')



      # @messages = Message.where(@membership.channel_id == params[:channel_id])
      # @messages = Message.order('created_at desc').all

      @save = Message.new

    end
  end

  def create

    @save = Message.new(message: params[:message])
    if @membership = Membership.find_by_user_id_and_channel_id(current_user.id,
                                                            session[:channel_id])
      @save.membership_id = @membership.id
    end
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
