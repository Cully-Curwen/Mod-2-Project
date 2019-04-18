class UsersController < ApplicationController
    
 def index
   if @current_user
      redirect_to current_user
    end
  end 

  def new
      @user = User.new
  end
#! These two are part of the registration process 
  def create
        # byebug
        # @user = User.create(user_params)
      @user =  User.new(user_params)
      if @user.valid?
          @user.save
          session[:user_id] = @user.id 
          redirect_to subscriptions_path
      else
        render :new
      end
   end
    
     
    
  def show
      if !@current_user
            flash[:notice] = "Please sign in to continue!"
            redirect_to "/login_form"
        # else
        #   @user = User.find(params[:id])
       end
   end

  def edit
      
   end

  def update
   #! if the person updates 
  #  byebug
    if !params[:user][:password].empty?
        if current_user.authenticate(params[:user][:password])
          #* if this authenticates we update the old pass with new pass
          params[:user][:password] = params[:user][:new_password]
          current_user.update(user_params)
          redirect_to current_user
         else
          flash[:notice] = "Incorrect password! Try again"
          redirect_to edit_user_path
         end
      else 
        current_user.update(user_params)
        redirect_to current_user
      end 
   end
  #  byebug
  #  @player=Player.find(params[:id])
  #  @player.update(params_allowed)
  #  redirect_to @player # same as player_path(@player)
    #  User.update([params[:current_user])
    
      
    
      private
    
  def user_params
        params.require(:user).permit(:first_name,:last_name,:email,:password)
    end
    
end
