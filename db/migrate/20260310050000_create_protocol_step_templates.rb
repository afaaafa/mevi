class CreateProtocolStepTemplates < ActiveRecord::Migration[8.1]
  def change
    create_table :protocol_step_templates do |t|
      t.references :care_plan_template, null: false, foreign_key: true
      t.integer :day_offset, null: false
      t.text :message_body, null: false

      t.timestamps
    end
  end
end
