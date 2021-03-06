class Api::V1::UsersController < ApplicationController
  # before_action :set_user, only: [:show, :update, :destroy]

  def index
    begin
      users = User.all
      render json: users
    rescue StandardError => error
      render json: {:success => false, :msg => error.message}
    end
  end

  def show
    begin
      user = User.find(params[:id])
      monitoring_settings = MonitoringSetting.where(user_id: current_api_user)
      verification_timing = { every_10minutes: "10minutes", every_hour: "hour", every_3hours: "3hours" }
      render json: {:success => true, :user => user, :monitoring_settings => monitoring_settings, :verification_timing => verification_timing}
    rescue StandardError => error
      render json: {:success => false, :msg => error.message}
    end
  end

  def create
  end

  def update
    user = User.find(params[:id])
    if user.update(user_params)
      render json: user
    else
      render json: user.errors, status: :unprocessable_entity
    end
  end

  def destroy
    user = User.find(params[:id])
    user.destroy
    render json: user
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