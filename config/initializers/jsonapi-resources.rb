# frozen_string_literal: true

JSONAPI.configure do |config|
  config.json_key_format = :underscored_key
  config.exception_class_whitelist = [
    Pundit::NotAuthorizedError,
    ActiveRecord::RecordNotFound
  ]
  config.default_paginator = :paged
  config.default_page_size = 20
  config.maximum_page_size = 20
end
