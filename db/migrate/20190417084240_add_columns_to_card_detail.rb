class AddColumnsToCardDetail < ActiveRecord::Migration[5.2]
  def change
    add_column :card_details, :card_holder_name, :string
    add_column :card_details, :card_provider, :string
    add_column :card_details, :card_type, :string
  end
end
