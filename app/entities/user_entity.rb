# frozen_string_literal: true

class UserEntity < BaseEntity
  expose :id
  expose :email
  expose :name
  expose :auth_token
end
