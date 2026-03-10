class ProtocolStepTemplate < ApplicationRecord
  belongs_to :care_plan_template

  validates :day_offset, presence: true
  validates :action_type, presence: true
  validates :message_body, presence: true

  default_scope { order(:day_offset) }
end
