# frozen_string_literal: true

require 'rails_helper'

RSpec.describe User do
  let(:user) { build(:user) }

  describe 'validation' do
    subject { user.save! }

    it 'validates presence of name' do
      user.name = nil
      expect { subject }.to raise_error "Validation failed: Name can't be blank"
      expect(user.errors.messages[:name]).to include("can't be blank")
    end

    it 'validates presence of email' do
      user.email = nil
      expect { subject }.to raise_error "Validation failed: Email can't be blank, Email is invalid"
    end

    it 'validates format of email' do
      user.email = 'invalid-email'
      expect { subject }.to raise_error 'Validation failed: Email is invalid'
    end
  end
end
