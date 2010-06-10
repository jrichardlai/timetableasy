class Ability
  include CanCan::Ability

  def initialize(user)
    if user.admin?
      can :manage, :all
      can :assign_roles, User do
        user.admin?
      end
    elsif user.manager?
      can :manage_campus, User do
        user.manager?
      end
      can :manage, Campus do |action, campus|
        campus && campus.managers.include?(user)
      end
      can :manage, Classroom do |action, classroom|
        classroom.blank? || classroom && user.managed_campuses.include?(classroom.campus)
      end
      can :create, Classroom
      can :manage, Event do |action, event|
        event and case event.event_scope_type
        when 'Campus'
          user.managed_campuses.include?(event.event_scope)
        when 'Classroom'
          user.managed_campuses.include?(event.event_scope.campus)
        else
          not event.event_scope_type.blank? and !event.global_event? and user == event.event_scope
        end
      end
      can :read, :all
    else
      can :manage, Event do |action, event|
        event and not event.event_scope_type.blank? and user == event.event_scope
      end
      can :read, :all
    end
  end
end