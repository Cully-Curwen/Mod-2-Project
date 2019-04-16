class PastPayment < ApplicationRecord
  belongs_to :subscription
  belongs_to :user
  belongs_to :currency

  def payment_method
    case payment_method_type
    when "Direct Debit"
      BankDetail.find(self.payment_method_id) 
    when "Card"
      CardDetail.find(self.payment_method_id)
    when "PayPal"
      PaypalDetail.find(self.payment_method_id)
    else
      # Need to set an error message here
    end
  end

  def payment_method=(payment_method_id, payment_method_type)
    @payment_method_id = payment_method_id
    @payment_method_type = payment_method_type
  end
end
