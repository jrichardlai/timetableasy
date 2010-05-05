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
      can :manage, Campus do |campus|
        campus && campus.managers.include?(user)
      end
      can :manage, Classroom do |classroom|
        classroom && user.campuses.include?(classroom.campus)
      end
      can :read, :all
    else
      can :read, :all
    end
  end
end