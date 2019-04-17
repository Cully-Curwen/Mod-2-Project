class BankDetailsController < ApplicationController

  def new
    @bank_details = BankDetail.new
  end

  def edit
    # secure logic to stop other user edditing
    @bank_details = BankDetail.where(id: params[:id], user_id: @current_user.id).first!
  end

  def update
    bank_details = BankDetail.where(id: params[:id], user_id: @current_user.id).first!
    bank_details.update(params_bank_details)

    redirect_to controller: 'payment_method'
  end

  private

  def params_bank_details
    params.require(:bank_detail).permit(:id, :user_id, :account_holder_name, :account_name, :bank_name)
  end

end
