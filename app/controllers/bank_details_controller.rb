class BankDetailsController < ApplicationController

  def new
    @bank_details = BankDetail.new
  end

  def edit
    # secure logic to stop other user edditing
    @bank_details = @current_user.bank_details.select{|e| e.id == params[:id] }
  end

end
