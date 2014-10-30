require 'omniauth-oauth2'

module OmniAuth
  module Strategies
    class Wunderlist < OmniAuth::Strategies::OAuth2
      option :name, 'wunderlist'
      option :client_options, {
        site: "https://a.wunderlist.com/api",
        authorize_url: "https://www.wunderlist.com/oauth/authorize",
        token_url: "https://www.wunderlist.com/oauth/access_token",
        connection_opts: {
          headers: {
            'Accept' => 'application/json',
            'Content-Type' => 'application/json',
          }
        }
      }

      def request_phase
        super
      end

      uid { raw_info['id'] }

      info do
        {
          email: raw_info['email'],
          name: raw_info['name']
        }
      end

      extra do
        { raw_info: raw_info }
      end

      def raw_info
        access_token.options[:mode] = :query
        @raw_info ||= access_token.get('/api/v1/user', {
          headers: {
            'X-Client-ID' => access_token.client.id,
            'X-Access-Token' => access_token.token
          }
        }).parsed
      end
    end
  end
end