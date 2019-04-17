class AddColumnsToBankDetail < ActiveRecord::Migration[5.2]
  def change
    add_column :bank_details, :account_holder_name, :string
    add_column :bank_details, :bank_name, :string
    add_column :bank_details, :account_name, :string
  end
end
