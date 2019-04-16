class SessionsController < ApplicationController 

    def login
        user = User.find_by(email: params[:user][:email])
        # byebug
    if  user && user.authenticate(params[:user][:password])

        session[:user_id] = user.id

        redirect_to profile_path
    else
        flash[:notice] = "Wrong credentials! Try again"
        redirect_to "/login_form"
    end    
  end

  def logout
    session[:user_id] = nil

    redirect_to "/login_form"
  end



end