# frozen_string_literal: true

class UserPolicy < BasePolicy
  def index?
    true
  end

  def create?
    true
  end

  def update?
    true
  end

  def destroy?
    true
  end

  def show?
    true
  end

  def new?
    true
  end

  def edit?
    true
  end
end
