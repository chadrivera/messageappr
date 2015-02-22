class RegisterController < ApplicationController

  def show
    unless session[:register_username] != ''
      redirect_to '/login'
    end
    @name = session[:register_username]
    @user = User.new

  end

  def create

    @user = User.new
    @user.username = session[:register_username]
    %i[street city state zip phone email].each do |attr|
      @user.send("#{attr}=",params[attr])
    end

    if @user.save
      session[:current_user_id] = @user.id
      redirect_to('/channel')
      session[:register_username] = ''
    else
      @name = session[:register_username]
      render 'show'
    end
  end
end
