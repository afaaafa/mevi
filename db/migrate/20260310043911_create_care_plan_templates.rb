class CreateCarePlanTemplates < ActiveRecord::Migration[8.1]
  def change
    create_table :care_plan_templates do |t|
      t.string :name, null: false
      t.text :description
      t.string :category
      t.references :user, null: true, foreign_key: true

      t.timestamps
    end
  end
end
