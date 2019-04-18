class PastPayment < ApplicationRecord
  belongs_to :subscription
  belongs_to :user
  belongs_to :currency

  def payment_method
    case @payment_method_type
    when "Direct Debit"
      BankDetail.find(id: @payment_method_id) 
    when "Card"
      CardDetail.find(id: @payment_method_id)
    when "PayPal"
      PaypalDetail.find(id: @payment_method_id)
    else
      # Need to set an error message here
    end
  end

  def payment_method=(payment_object)
    @payment_method_id = payment_object.id
    @payment_method_type = payment_object.type
  end
end
