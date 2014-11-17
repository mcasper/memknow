class RemakeUserWithoutDevise < ActiveRecord::Migration
  def change
    drop_table :users

    create_table :users do |t|
      t.text :email
      t.text :password_digest
      t.text :first_name
      t.text :last_name
    end

    add_index :users, :email, unique: true
  end
end
