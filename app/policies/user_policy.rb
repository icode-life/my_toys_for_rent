class UserPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def show?
    true
    # user_or_admin?  #only user or admin can change
  end

  def update?
    user_or_admin?  #only user or admin can change
  end

  private

  def user_or_admin?
    return record.user == user || user.admin
  end
end
