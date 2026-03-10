class ProtocolStep < ApplicationRecord
  belongs_to :care_plan
  belongs_to :protocol_step_template

  validates :day_offset, presence: true
  validates :message_body, presence: true
  validates :scheduled_date, presence: true
  validates :status, presence: true, inclusion: { in: %w[pending sent] }

  default_scope { order(:scheduled_date) }
end
