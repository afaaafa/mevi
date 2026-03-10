class CreatePatients < ActiveRecord::Migration[8.1]
  def change
    create_table :patients do |t|
      t.references :user, null: false, foreign_key: true
      t.string :name, null: false
      t.date :birth_date, null: false
      t.string :email
      t.string :phone, null: false
      t.text :description

      t.timestamps
    end
  end
end
