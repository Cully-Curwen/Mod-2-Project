class User < ApplicationRecord
  has_many :subscriptions
  has_many :past_payments
  has_many :bank_details
  has_many :card_details
  has_many :paypal_details
end
