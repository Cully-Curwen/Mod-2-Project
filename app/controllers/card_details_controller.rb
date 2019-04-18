class CardDetailsController < ApplicationController

  def new
    @card_details = CardDetail.new
  end

  def create
    @card_details = BankDetail.create(params_card@card_details)
    if @card_details.valid?
      session[:subscription][:payment_method_type] = "Card"
      session[:subscription][:payment_method_id] = @card_details.id
      redirect_to controller: 'payment_method'
    else
      redirect_to new_bank_detail_path
    end
  end

  def edit
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
