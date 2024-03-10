# frozen_string_literal: true

module Api
  class BaseController < ApplicationController
    include ApiHelper

    before_action :authenticate_user!

    def authenticate_user!
      if request.headers['Authorization'].present?
        @current_user = User.find_by_auth_token(request.headers['Authorization'])
        render json: { error: 'Invalid authentication token' }, status: :unauthorized unless @current_user
      else
        render json: { error: 'No authentication token' }, status: :unauthorized
      end
    end
  end
end
