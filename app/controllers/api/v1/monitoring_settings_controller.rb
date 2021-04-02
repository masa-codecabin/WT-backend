class Api::V1::MonitoringSettingsController < ApplicationController
  protect_from_forgery

  def index
  end

  def show
  end

  def create
    monitoring_setting = MonitoringSetting.new(monitoring_setting_params)
    if monitoring_setting.save
      render json: monitoring_setting, status: :created, location: users_path(current_user)
    else
      render json: monitoring_setting.errors, status: :unprocessable_entity
    end
  end

  def update
    monitoring_setting = MonitoringSetting.find(params[:id])
    if monitoring_setting.update_attributes(update_monitoring_setting_params)
      render json: monitoring_setting
    else
      render json: monitoring_setting.errors, status: :unprocessable_entity
    end
  end

  def destroy
    begin
      monitoring_setting = MonitoringSetting.find(params[:id])
      monitoring_setting.destroy
      render json: {:success => true, :monitoring_setting => monitoring_setting}
    rescue StandardError => error
      render json: {:success => false, :msg => error.message}
    end
  end

  private

    def monitoring_setting_params
      params.require(:monitoring_setting).permit(:url, :verification_timing, :user_id)
    end

    def update_monitoring_setting_params
      params.require(:monitoring_setting).permit(:url, :verification_timing)
    end

end
