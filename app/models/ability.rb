class Ability
  include CanCan::Ability

  def initialize(user)
    if user.admin?
      can :manage, :all
    if user.manager?
      can :manage, Campus do |campus|
        campus && campus.managers.includes? user
      end
      can :manage, Classroom do |classroom|
        classroom && user.campuses.includes? classroom.campus
      end
      can :read, :all
    else
      can :read, :all
    end
  end
end