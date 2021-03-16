# frozen_string_literal: true

#
# Safe mode
# Override mthodes to grant access to users
#
class CityPolicy < BasePolicy
  def index?
    true
  end

  def create?
    user.admin?
  end

  def update?
    user.admin?
  end

  def destroy?
    user.admin?
  end

  def show?
    true
  end

  def new?
    user.admin?
  end

  def edit?
    user.admin?
  end
end
