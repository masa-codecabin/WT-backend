class MonitoringSetting < ApplicationRecord
  belongs_to :user
  has_many :attempts
  has_many :user_and_monitoring_settings
end
