# frozen_string_literal: true

shared_examples 'an authenticated endpoint' do |action:, method:, params: {}|
  let(:user) { create(:user) }
  let(:auth_token) { user.auth_token }

  context 'when the request has a valid auth token' do
    it 'returns successful http response' do
      request.headers['Authorization'] = auth_token
      send(method, action, params:)
      expect(response).to have_http_status(:success)
    end
  end

  context 'when the request has an invalid auth token' do
    subject do
      request.headers['Authorization'] = 'INVALID_AUTH_TOKEN'
      send(method, action, params:)
    end

    it 'returns unauthorized http response' do
      subject
      expect(response).to have_http_status(:unauthorized)
    end

    it 'Returns Invalid authentication token error message' do
      subject
      expect(JSON.parse(response.body)['error']).to eq('Invalid authentication token')
    end
  end

  context 'when the request has no auth token' do
    subject { send(method, action, params:) }

    it 'returns unauthorized http response' do
      subject
      expect(response).to have_http_status(:unauthorized)
    end

    it 'Returns No authentication token error message' do
      subject
      expect(JSON.parse(response.body)['error']).to eq('No authentication token')
    end
  end
end
