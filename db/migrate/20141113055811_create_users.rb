class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.text :first_name, null: false
      t.text :last_name
      t.text :login, null: false
      t.text :password, null: false
      t.boolean :is_admin, null: false, default: false

      t.timestamps null: false
    end
  end
end
