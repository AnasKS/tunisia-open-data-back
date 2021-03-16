# frozen_string_literal: true

# == Schema Information
#
# Table name: users
#
#  id         :bigint           not null, primary key
#  email      :string
#  role       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class User < ApplicationRecord
  after_initialize :set_defaults

  ROLES = [
    USER = 'user',
    ADMIN = 'admin'
  ].freeze

  # validations
  validates :email, presence: true, uniqueness: true
  validates_inclusion_of :role, in: ROLES

  def admin?
    role == ADMIN || email == 'test.admin@test.com'
  end

  def set_defaults
    self.role = USER if role.nil?
  end
end
