class CreatePaypalDetails < ActiveRecord::Migration[5.2]
  def change
    create_table :paypal_details do |t|
      t.belongs_to :user, foreign_key: true

      t.timestamps
    end
  end
end
