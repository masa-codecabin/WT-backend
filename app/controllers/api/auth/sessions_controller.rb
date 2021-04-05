module Api
  module Auth
    class SessionsController < DeviseTokenAuth::SessionsController
      wrap_parameters format: []
    end
  end
end