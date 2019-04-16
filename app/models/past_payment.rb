class PastPayment < ApplicationRecord
  belongs_to :subscription
  belongs_to :user
  belongs_to :currency
end
