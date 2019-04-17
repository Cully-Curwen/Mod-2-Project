class PaymentMethodController < ApplicationController
  def index
    # user session logic
    @bank_details = @current_user.bank_details
    @card_details = @current_user.card_details
    @paypal_details = @current_user.paypal_details
    # byebug
  end

  def new
  end
end
