# frozen_string_literal: true

JSONAPI.configure do |config|
	config.default_processor_klass = JSONAPI::Authorization::AuthorizingProcessor
  config.json_key_format = :underscored_key
  config.exception_class_whitelist = [
    Pundit::NotAuthorizedError,
    ActiveRecord::RecordNotFound
  ]
  config.top_level_meta_include_page_count = true
  config.top_level_meta_include_record_count = true
  config.default_paginator = :paged
  config.default_page_size = 20
  config.maximum_page_size = 20
end
