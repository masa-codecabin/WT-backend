Rails.application.routes.draw do
  namespace :api do
    mount_devise_token_auth_for 'User', at: 'auth', controllers: {
        registrations: 'api/auth/registrations'
    }

    namespace :v1 do
      resources :users do
        resources :monitoring_settings
      end
    end
  end
end
