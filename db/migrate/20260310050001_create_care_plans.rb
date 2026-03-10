class CreateCarePlans < ActiveRecord::Migration[8.1]
  def change
    create_table :care_plans do |t|
      t.references :patient, null: false, foreign_key: true
      t.references :care_plan_template, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true
      t.date :reference_date, null: false
      t.string :status, null: false, default: "active"

      t.timestamps
    end
  end
end
