class PaypalDetailsController < ApplicationController

  def new
    @paypal_details = PaypalDetail.new
  end

  def create
    @paypal_details = BankDetail.create(params_pay@paypal_details)
    if @paypal_details.valid?
      session[:subscription][:payment_method_type] = "PayPal"
      session[:subscription][:payment_method_id] = @paypal_details.id
      redirect_to controller: 'payment_method'
    else
      redirect_to new_bank_detail_path
    end
  end

  def edit
    # secure logic to stop other user edditing
    @paypal_details = PaypalDetail.where(id: params[:id], user_id: @current_user.id).first!
  end

  def update
    paypal_details = PaypalDetail.where(id: params[:id], user_id: @current_user.id).first!
    paypal_details.update(params_paypal_details)

    redirect_to controller: 'payment_method'
  end

  private

  def params_paypal_details
    params.require(:paypal_detail).permit(:id, :user_id, :account_email)
  end

end
