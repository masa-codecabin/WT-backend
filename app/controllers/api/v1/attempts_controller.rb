class Api::V1::AttemptsController < ApplicationController
  def index
  end

  def show
  end

  def create
    attempt = Attempt.new(attempt_params)
    if attempt.save
      render json: attempt, status: :created
    else
      render json: attempt.errors, status: :unprocessable_entity
    end
  end

  def update
  end

  def destroy
  end

  private

    def attempt_params
      params.permit(:status, :monitoring_setting_id)
    end

end
