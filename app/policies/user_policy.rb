# frozen_string_literal: true

class UserPolicy < ApplicationPolicy
  def index?
    user.admin?
  end

  def show?
    user.admin?
  end

  def create?
    user.admin?
  end

  def update?
    user.admin?
  end

  # Admins may not delete themselves, so the last admin cannot lock everyone out.
  def destroy?
    user.admin? && record != user
  end

  # Only admins may set the admin flag, and never on their own account.
  def permitted_attributes
    attrs = %i[nickname email password password_confirmation]
    attrs << :admin if user.admin? && record != user
    attrs
  end
end
