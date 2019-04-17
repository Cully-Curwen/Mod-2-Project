class PaypalDetailsController < ApplicationController

  def new
    @paypal_details = PaypalDetail.new
  end
  
  def edit
    # secure logic to stop other user edditing
    @paypal_details = @current_user.bank_details.select{|e| e.id == params[:id] }
  end

end
