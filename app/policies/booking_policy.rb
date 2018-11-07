class BookingPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      if user.admin?
        scope.all
      else
        scope.where(user: user)
      end
    end
  end

  def show?
    user_or_admin?
    # scope.where(:id => record.id).exists?
    # return true
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
