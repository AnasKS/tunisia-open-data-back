# frozen_string_literal: true

#
# Safe mode
# Override mthodes to grant access to users
#
class BasePolicy
  attr_reader :user, :record

  def initialize(user, record)
    @user = user
    @record = record
  end

  def index?
    false
  end

  def create?
    false
  end

  def update?
    false
  end

  def destroy?
    false
  end

  def show?
    false
  end

  def new?
    create?
  end

  def edit?
    update?
  end

  # Visibility scope
  class Scope
    attr_reader :user, :scope

    def initialize(user, scope)
      @user = user
      @scope = scope
    end

    def resolve
      scope
    end
  end
end
