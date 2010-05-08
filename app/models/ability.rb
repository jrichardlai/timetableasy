class Ability
  include CanCan::Ability

  def initialize(user)
    if user.admin?
      can :manage, :all
      can :assign_roles, User do
        user.admin?
      end
    end
    if user.manager?
      can :update, Campus do |campus|
        campus && campus.managers.include?(user)
      end
      can :update, Classroom do |classroom|
        classroom && user.managed_campuses.include?(classroom.campus)
      end
      can :create, Classroom do |classroom|
        classroom.campus.nil? or user.managed_campuses.include?(classroom.campus)
      end
      can :read, :all
    else
      can :read, :all
    end
  end
end