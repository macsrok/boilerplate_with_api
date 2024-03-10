# frozen_string_literal: true

module ApiHelper
  def respond_with(object, options = {})
    render json: options[:entity].to_s.constantize.represent(object)
  end
end
