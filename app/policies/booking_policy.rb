class BookingPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def create?
    return true
  end

  def update?
    user_or_admin?
  end

  def destroy?
    user_or_admin?
  end

  private

  def user_or_admin?
    return record.user == user || user.admin
  end
end
