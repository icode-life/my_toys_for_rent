class ToyPolicy < ApplicationPolicy
  class Scope < Scope
  end

  def show?
    true  #Everyone can see toys
  end

  def create?
    return true  #loged in user can create
  end

  def update?
    user_or_admin?  #only user or admin can change
  end

  def destroy?
    user_or_admin?  #same
  end

  private

  def user_or_admin?
    return record.owner == user || user.admin
  end
end
