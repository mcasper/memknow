class RemoveNullConstraintsFromUser < ActiveRecord::Migration
  def change
    change_column :users, :first_name, :text, null: true
  end
end
