# frozen_string_literal: true

SimpleCov.start do
  add_group 'Models', 'app/models'
  add_group 'Controllers', 'app/controllers'

  add_filter 'app/assets'
  add_filter 'app/coffeescripts'
  add_filter 'app/helpers'
  add_filter 'app/inputs'
  add_filter 'app/presenters'
  add_filter 'app/uploaders'
  add_filter 'app/views'
  add_filter 'test'
  add_filter 'spec'
  add_filter 'vendor'
end
