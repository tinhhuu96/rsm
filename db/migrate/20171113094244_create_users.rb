class CreateUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :users do |t|
      t.string :name
      t.date :birthday
      t.string :email
      t.string :phone
      t.text :address
      t.boolean :sex
      t.integer :role

      t.timestamps
    end
    add_index :users, :name
    add_index :users, :email, unique: true
  end
end
