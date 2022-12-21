# frozen_string_literal: true

require 'spec_helper'

describe OmniAuth::Strategies::DocuSign do
  subject(:strategy) { described_class.new('USER', '123', sandbox: sandbox) }

  let(:sandbox) { nil }

  describe '#client' do
    subject(:client) { strategy.client }

    it 'uses the production site by default' do
      expect(client.site).to eq(OmniAuth::Strategies::DocuSign::PRODUCTION_URL)
    end

    context 'when sandbox option is true' do
      let(:sandbox) { true }

      it 'uses the sandbox site' do
        expect(client.site).to eq(OmniAuth::Strategies::DocuSign::SANDBOX_URL)
      end
    end
  end

  describe '#info.email' do
    before do
      allow(Faraday).to receive(:new).and_return(faraday_client)
      allow(faraday_client).to receive(:get).and_return(faraday_response)
    end

    let(:faraday_client)   { instance_double(Faraday::Connection) }
    let(:faraday_response) { instance_double(Faraday::Response, body: JSON.generate(user_info)) }

    let(:user_info) { { accounts: [{ account_id: '123' }], email: 'you@example.com' } }

    it 'uses the email from the user info request' do
      expect(strategy.info['email']).to eq('you@example.com')
    end
  end
end
