class Subscription < ApplicationRecord
  belongs_to :user
  belongs_to :company
  belongs_to :currency
  has_many :future_payments
  has_many :past_payments

  def payment_method
    case self.payment_method_type
    when "Direct Debit"
      BankDetail.find(self.payment_method_id) 
    when "Card"
      CardDetail.find(id: self.payment_method_id)
    when "PayPal"
      PaypalDetail.find(id: self.payment_method_id)
    else
      false
    end
  end

  # def payment_method=(payment_object)
  #   @payment_method_id = payment_object.id
  #   @payment_method_type = payment_object.type
  # end
end
