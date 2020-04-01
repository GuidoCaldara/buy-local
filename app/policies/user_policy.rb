class UserPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end


  def dashboard?
    true
  end

  def new_access_modal?
    true
  end
end
