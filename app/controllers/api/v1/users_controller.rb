class Api::V1::UsersController < ApplicationController
  protect_from_forgery
  before_action :set_user, only: [:show, :update, :destroy]

  def index
    begin
      users = User.all
      render json: {:success => true, :users => users}
    rescue StandardError => error
      render json: {:success => false, :msg => error.message}
    end
  end

  def show
    begin
      monitoring_settings = MonitoringSetting.where(user_id: current_user)
      verification_timing = { every_10minutes: "10minutes", every_hour: "hour", every_3hours: "3hours" }
      render json: {:success => true, :user => user, :monitoring_settings => monitoring_settings, :verification_timing => verification_timing}
    rescue StandardError => error
      render json: {:success => false, :msg => error.message}
    end
  end

  def create
  end

  def update
    if user.update(user_params)
      render json: user
    else
      render json: user.errors, status: :unprocessable_entity
    end
  end

  def destroy
    user.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      user = User.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def user_params
      params.fetch(:user, {})
    end

end