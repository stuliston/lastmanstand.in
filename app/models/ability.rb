class Ability
  include CanCan::Ability

  def initialize(user)
    # https://github.com/ryanb/cancan/wiki/Defining-Abilities
    user ||= User.new # guest user (not logged in)
    can :manage, :all
  end

end
