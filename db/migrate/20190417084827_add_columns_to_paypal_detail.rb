class AddColumnsToPaypalDetail < ActiveRecord::Migration[5.2]
  def change
    add_column :paypal_details, :account_email, :string
  end
end
