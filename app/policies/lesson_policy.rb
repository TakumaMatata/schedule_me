class LessonPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      if user.role =="manager"
        scope.all
      else
        scope.where(user_id: user.id)
      end
    end
  end

  def show?
    true
  end

  def new?
    manager?
  end

  def create?
    manager?
  end

  def edit?
    manager?
  end

  def update?
    manager?
  end

  def destroy?
    manager?
  end

  private

  def manager?
    @user.role == "manager"
  end
end
