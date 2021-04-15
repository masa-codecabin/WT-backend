module Api
  module Auth
    module Users
    class OmniauthCallbacksController < DeviseTokenAuth::OmniauthCallbacksController


      skip_before_action :skip_session

      def redirect_callbacks
        super
      end
      def omniauth_success
        super
        update_auth_header
      end
      def omniauth_failure
        super
      end

      protected

        def get_resource_from_auth_hash
          super
          @resource.credentials = auth_hash["credentials"]
          clean_resource
        end

        def render_data_or_redirect(message, data, user_data = {})
          if Rails.env.production?
            if ['inAppBrowser', 'newWindow'].include?(omniauth_window_type)
              render_data(message, user_data.merge(data))
            elsif auth_origin_url
              redirect_to DeviseTokenAuth::Url.generate(auth_origin_url, data.merge(blank: true))
            else
              fallback_render data[:error] || 'An error occurred'
            end
          else

            render json: @resource, status: :ok
          end
        end

    end
   end
  end
end