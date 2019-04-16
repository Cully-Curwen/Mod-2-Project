class CreateCurrencies < ActiveRecord::Migration[5.2]
  def change
    create_table :currencies do |t|
      t.string :base
      t.timestamp :timestamp
      t.date :date
      t.float :rates_GBP
      t.float :rates_USD
      t.float :rates_EUR

      t.timestamps
    end
  end
end
