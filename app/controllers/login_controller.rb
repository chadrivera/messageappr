class LoginController < ApplicationController

  def show

    if session[:loginerror]

      @errormessage = "Your name cannot be blank..."
    end
    session[:loginerror] = false
  end

  def auth
    if params[:username] == ''
      session[:loginerror] = true
      render 'show'
    elsif (user = User.find_by(username: params[:username]))
      session[:current_user_id] = user.id
      redirect_to('/channel')
    else
      session[:register_username] = params[:username]
      redirect_to('/register')
    end

  end
end
