class FuturePayment < ApplicationRecord
  belongs_to :subscription
  has_one :user, through: :subscription
end
