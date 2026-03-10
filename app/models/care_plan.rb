class CarePlan < ApplicationRecord
  belongs_to :patient
  belongs_to :user
  belongs_to :care_plan_template

  has_many :protocol_steps, dependent: :destroy

  validates :reference_date, presence: true
  validates :status, presence: true, inclusion: { in: %w[active paused completed] }

  after_create :create_protocol_steps_from_template

  private

  def create_protocol_steps_from_template
    care_plan_template.protocol_step_templates.each do |template_step|
      protocol_steps.create!(
        protocol_step_template: template_step,
        day_offset: template_step.day_offset,
        message_body: template_step.message_body,
        scheduled_date: reference_date + template_step.day_offset.days,
        status: "pending"
      )
    end
  end
end
