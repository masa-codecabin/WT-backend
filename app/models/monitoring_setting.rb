class MonitoringSetting < ApplicationRecord
  belongs_to :user
  has_many :attempts, dependent: :destroy
  has_many :user_and_monitoring_settings

  def self.import(file)
    CSV.foreach(file.path, headers: true) do |row|
      monitoring_setting = find_by(id: row["id"]) || new
      monitoring_setting.attributes = row.to_hash.slice(*updatable_attributes)
      monitoring_setting.save!(validate: false)
    end
  end

  def self.updatable_attributes
    ['url', 'verification_timing', 'user_id']
  end
end
