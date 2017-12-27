class CreateBranches < ActiveRecord::Migration[5.1]
  def change
    create_table :branches do |t|
      t.boolean :is_primary, default: 0, null: false
      t.string :name, null: false
      t.string :phone
      t.string :street, null: false
      t.string :ward
      t.string :district
      t.string :province, null: false
      t.string :country, null: false
      t.references :company, foreign_key: true

      t.timestamps
    end
  end
end
