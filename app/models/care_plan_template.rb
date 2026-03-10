class CarePlanTemplate < ApplicationRecord
  belongs_to :user, optional: true

  has_many :protocol_step_templates, dependent: :destroy
  has_many :care_plans, dependent: :restrict_with_error

  scope :system_templates, -> { where(user: nil) }
  scope :for_user, ->(user) { where(user: user) }

  validates :name, presence: true
end
