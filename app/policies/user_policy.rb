class UserPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def show?
    true
  end

  # def new?
  #   manager?
  # end

  # def create?
  #   manager?
  # end

  def edit?
    true
  # manager? || record.user == user
  # nozomi made it true bc, i got errer that says 'user' is undefined
  end

  def update?
    true
  end

  def destroy?
    manager?
  end
  private

  def manager?
    @user.role == "manager"
  end
end
