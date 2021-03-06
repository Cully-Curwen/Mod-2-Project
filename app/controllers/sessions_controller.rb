class SessionsController < ApplicationController 


    def login_form
    
    end

    def register
        @user =  User.new
    end

    def create
      @user =  User.new(register_params)
      if @user.valid?
          @user.save
          session[:user_id] = @user.id 
          redirect_to subscriptions_path
      else
        render :register
      end
   end
    
    def login
        user = User.find_by(email: params[:user][:email])
        # byebug
    if  user && user.authenticate(params[:user][:password])

        session[:user_id] = user.id #! this bit of code is what creates the session

        redirect_to subscriptions_path
    else
        flash[:notice] = "Wrong credentials! Try again"
        redirect_to "/login_form"
    end    
  end

  def logout
      session[:user_id] = nil

      redirect_to "/users"
  end

  def splash
  end

  private

  def register_params
    params.require(:user).permit(:first_name,:last_name,:email,:password)
  end

end