class BankDetailsController < ApplicationController

  def edit
    # secure logic to stop other user edditing
    @bank_details = @current_user.bank_details.select{|e| e.id == params[:id] }
  end

end
