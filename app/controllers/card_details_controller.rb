class CardDetailsController < ApplicationController

  def new
    @card_details = CardDetail.new
  end

  def edit
    # secure logic to stop other user edditing
    @card_details = CardDetail.where(id: params[:id], user_id: @current_user.id).first!
  end

  def update
    card_details = CardDetail.where(id: params[:id], user_id: @current_user.id).first!
    card_details.update(params_card_details)

    redirect_to controller: 'payment_method'
  end

  private

  def params_card_details
    params.require(:card_detail).permit(:id, :user_id, :card_holder_name, :card_provider, :card_type)
  end

end
