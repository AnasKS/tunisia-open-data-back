# frozen_string_literal: true

class V1::BaseResource < JSONAPI::Resource
  include JSONAPI::Authorization::PunditScopedResource
  abstract

  def self.creatable_fields _context
    super - %i[created_at updated_at user_id]
  end

  def self.updatable_fields _context
    super - %i[created_at updated_at]
  end
end
