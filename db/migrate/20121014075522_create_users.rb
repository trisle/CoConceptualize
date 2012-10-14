class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.integer :id
      t.string :username
      t.string :password
      t.string :firstname
      t.string :lastname
      t.string :email

      t.timestamps
    end
  end
end
