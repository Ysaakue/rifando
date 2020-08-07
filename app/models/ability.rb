# frozen_string_literal: true

class Ability
  include CanCan::Ability

  def initialize(user)
    if user.present?
      can :manage, Rafle, owner_id: user.id
    else
      can :read, :all
    end
  end
end
