# frozen_string_literal: true

# freeze_string_literal: true

require 'rails_helper'

RSpec.describe Api::UsersController, type: :controller do
  describe 'GET #me' do
    let(:user) { create(:user) }

    it_behaves_like 'an authenticated endpoint', action: :me, method: 'get'

    subject do
      request.headers['Authorization'] = user.auth_token
      get :me
    end

    it 'returns a json respresentation of the current user' do
      subject
      expect(response.body).to eq(UserEntity.new(user).to_json)
    end
  end
end
