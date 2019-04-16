class EditColumn < ActiveRecord::Migration[5.2]
  def change
    rename_column :users, :second_name, :last_name
  end
end
