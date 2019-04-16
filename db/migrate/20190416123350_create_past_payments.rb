class CreatePastPayments < ActiveRecord::Migration[5.2]
  def change
    create_table :past_payments do |t|
      t.belongs_to :subscription, foreign_key: true
      t.date :date
      t.belongs_to :user, foreign_key: true
      t.string :product
      t.integer :billing_value
      t.belongs_to :currency, foreign_key: true
      t.string :payment_method_type
      t.integer :payment_method_id

      t.timestamps
    end
  end
end
