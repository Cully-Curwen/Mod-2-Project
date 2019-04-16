class CreateFuturePayments < ActiveRecord::Migration[5.2]
  def change
    create_table :future_payments do |t|
      t.belongs_to :subscription, foreign_key: true
      t.date :data

      t.timestamps
    end
  end
end
