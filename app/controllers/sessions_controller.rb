class SessionsController < ApplicationController 


    def login_form
    
    end
    
    def login
        user = User.find_by(email: params[:user][:email])
        # byebug
    if  user && user.authenticate(params[:user][:password])

        session[:user_id] = user.id #! this bit of code is what creates the session

        redirect_to current_user
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