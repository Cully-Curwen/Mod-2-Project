class CreateSubscriptions < ActiveRecord::Migration[5.2]
  def change
    create_table :subscriptions do |t|
      t.belongs_to :user, foreign_key: true
      t.belongs_to :company, foreign_key: true
      t.string :product
      t.integer :billing_value
      t.string :billing_frequency
      t.belongs_to :currency, foreign_key: true
      t.string :contract_type
      t.date :contract_start
      t.date :contract_end
      t.string :payment_method_type
      t.integer :payment_method_id

      t.timestamps
    end
  end
end
