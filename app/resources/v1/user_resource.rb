# frozen_string_literal: true

module V1
  class UserResource < V1::BaseResource
    attributes :email, :role
  end
end
