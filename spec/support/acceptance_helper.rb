# frozen_string_literal: true

require 'rails_helper'
require 'rspec_api_documentation'
require 'rspec_api_documentation/dsl'

RspecApiDocumentation.configure do |config|
  config.docs_dir = Rails.root.join('doc')
  config.api_name = 'Tunisia Open Data API'
  config.keep_source_order = true
  config.format = [:api_blueprint]
  config.response_headers_to_include = []
  config.request_headers_to_include = ['Content-Type', 'Accept', 'Authorization']
end
