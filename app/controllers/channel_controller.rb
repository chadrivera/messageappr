class ChannelController < ApplicationController

  def show
    unless current_user != nil
      redirect_to '/login'
    end
    @channels = Channel.order('created_at desc').all
  end

  def set
    # find membership by user_id and channel_id
    unless current_user
      redirect_to '/login'
    end
    session[:channel_id] = params[:channel_id]
    
    redirect_to('/messages')
  end
end
