class CreateProtocolSteps < ActiveRecord::Migration[8.1]
  def change
    create_table :protocol_steps do |t|
      t.references :care_plan, null: false, foreign_key: true
      t.references :protocol_step_template, null: false, foreign_key: true
      t.integer :day_offset, null: false
      t.text :message_body, null: false
      t.date :scheduled_date, null: false
      t.string :status, null: false, default: "pending"

      t.timestamps
    end
  end
end
