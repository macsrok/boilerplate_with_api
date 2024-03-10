# frozen_string_literal: true

module Api
  class UsersController < BaseController
    def me
      respond_with @current_user, entity: UserEntity
    end
  end
end
