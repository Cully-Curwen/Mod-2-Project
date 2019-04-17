class PaypalDetailsController < ApplicationController

  def edit
    # secure logic to stop other user edditing
    @paypal_details = @current_user.bank_details.select{|e| e.id == params[:id] }
  end

end
