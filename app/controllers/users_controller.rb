class UsersController < ApplicationController
    
    def new
        @user = User.new
      end

    def create
        # byebug
        @user = User.create(user_params)
    
        redirect_to @user 
      end
    
     
    
      def show
        @user = User.find(params[:id])
      end
    
      def profile
        if !@current_user
          flash[:notice] = "Please sign in to continue!"
          redirect_to "/login_form"
        end
      end
    
      private
    
      def user_params
        params.require(:user).permit(:first_name,:last_name,:email,:password)
      end
end
