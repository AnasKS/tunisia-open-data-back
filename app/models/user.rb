class User < ApplicationRecord
  after_initialize :set_defaults
  
  ROLES = [
    USER = 'user',
    ADMIN = 'admin',
  ].freeze

  # validations
  validates :email, presence: true, uniqueness: true
  validates_inclusion_of :role, in: ROLES

  def admin?
    role == ADMIN
  end

  def set_defaults
    self.role = USER if role.nil?
  end
end
