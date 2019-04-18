class PaymentMethodController < ApplicationController
  def index
    # user session logic
    @bank_details = @current_user.bank_details
    @card_details = @current_user.card_details
    @paypal_details = @current_user.paypal_details
  end

  def new
  end

  def store
    store = params_store.to_hash.select{ |key, value| !value.empty? }
    store.map do |key, value|
      session[:subscription][key] = value
    end
    
    redirect_to new_subscription_path
  end

  def select
    @bank_details = @current_user.bank_details
    @card_details = @current_user.card_details
    @paypal_details = @current_user.paypal_details
    @payment_method = Subscription.new
  end

  private

  def params_store
    params.require(:subscription).permit(
      :payment_method_type,
      :payment_method_id
    )
  end

end
