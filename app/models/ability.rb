# frozen_string_literal: true

class Ability
  include CanCan::Ability

  def initialize(user)
    case user.user_type
    when 'admin'
      can :manage, Dealership
      can :manage, Car
    when 'user'
      can :read, Car
    end
  end
end
