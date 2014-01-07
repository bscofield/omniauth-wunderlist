require 'omniauth-oauth2'

module OmniAuth
  module Strategies
    class Wunderlist < OmniAuth::Strategies::OAuth2
      option :name, 'wunderlist'

      option :client_options, {
        site: "https://a.wunderlist.com/api",
        authorize_url: "https://provider.wunderlist.com/login/oauth/authorize",
        token_url: "https://provider.wunderlist.com/login/oauth/access_token"
      }

      uid { raw_info['id'] }

      extra do
        {:raw_info => raw_info}
      end

      def raw_info
        access_token.options[:mode] = :query
        access_token.options[:param_name] = :access_token
        @raw_info ||= access_token.get('/1/user.json').parsed
      end

    end
  end
end