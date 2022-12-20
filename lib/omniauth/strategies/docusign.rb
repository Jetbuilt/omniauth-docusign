# frozen_string_literal: true

require 'omniauth-oauth2'

module OmniAuth
  module Strategies
    class DocuSign < OmniAuth::Strategies::OAuth2
      SANDBOX_URL = 'https://account-d.docusign.com'
      PRODUCTION_URL = 'https://account.docusign.com'

      option :client_options, {
        authorize_url: '/oauth/auth',
        token_url: '/oauth/token'
      }

      uid { user_info['accounts'].first['account_id'] }

      info do
        {
          'uid' => user_info['accounts'].first['account_id'],
          'name' => user_info['name'],
          'email' => user_info['email'],
          'base_uri' => user_info['accounts'].first['base_uri']
        }
      end

      extra do
        { 'user_info' => user_info }
      end

      # Overrride client to merge in site based on sandbox option
      def client
        ::OAuth2::Client.new(
          options.client_id,
          options.client_secret,
          deep_symbolize(options.client_options).merge(site: site)
        )
      end

      def callback_url
        full_host + script_name + callback_path
      end

      private

      def site
        options.sandbox ? SANDBOX_URL : PRODUCTION_URL
      end

      def user_info
        return @user_info if @user_info

        response = faraday_client.get do |req|
          req.url '/oauth/userinfo'
          req.headers['Content-Type'] = 'application/json'
          req.headers['Authorization'] = "Bearer #{access_token.token}"
        end

        @user_info = MultiJson.decode(response.body)
      end

      def faraday_client
        Faraday.new(url: site) do |faraday|
          faraday.request  :url_encoded
          faraday.adapter  Faraday.default_adapter
        end
      end
    end
  end
end

OmniAuth.config.add_camelization 'docusign', 'DocuSign'
