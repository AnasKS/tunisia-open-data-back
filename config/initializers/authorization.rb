# frozen_string_literal: true

JSONAPI::Authorization.configure do |config|
  config.pundit_user = ->(context) { context[:current_user] }
end
