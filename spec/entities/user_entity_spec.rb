# frozen_string_literal: true

require 'rails_helper'

RSpec.describe UserEntity do
  let(:user) { create(:user) }
  subject { JSON.parse(UserEntity.represent(user).to_json) }

  it 'exposes id' do
    expect(subject['id']).to eq(user.id)
  end

  it 'exposes email' do
    expect(subject['email']).to eq(user.email)
  end

  it 'exposes name' do
    expect(subject['name']).to eq(user.name)
  end

  it 'exposes auth_token' do
    expect(subject['auth_token']).to eq(user.auth_token)
  end
end
