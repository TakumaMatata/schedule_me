class StudentPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def index?
    true
  end

  def show?
    true
    # manager? || record.user == user
  end

  # def new?
  #   manager?
  # end

  # def create?
  #   manager?
  # end

  def edit?
    manager? || record.user == user
  end

  def update?
    manager? || record.user == user
  end

  def destroy?
    manager?
  end
  private

  def manager?
    @user.role == "manager"
  end
end
