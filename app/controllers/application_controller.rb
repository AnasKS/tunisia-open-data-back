# frozen_string_literal: true

class ApplicationController < ActionController::Base
  include JSONAPI::ActsAsResourceController
  
  protect_from_forgery with: :null_session, if: proc { |c| c.request.format =~ %r{application/json} }
end
