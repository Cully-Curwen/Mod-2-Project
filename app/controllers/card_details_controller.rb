class CardDetailsController < ApplicationController

  def new
    @card_details = CardDetail.new
  end

  def edit
    # secure logic to stop other user edditing
    @card_details = @current_user.bank_details.select{|e| e.id == params[:id] }
  end

end
