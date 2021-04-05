class MonitoringSetting < ApplicationRecord
  belongs_to :user
  has_many :attempts, dependent: :destroy
  has_many :user_and_monitoring_settings
end
