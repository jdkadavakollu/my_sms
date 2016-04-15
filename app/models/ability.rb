class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new
    case user.role.name
    when 'super_admin'
      can :manage, :all
    when 'admin'
      hr(user)
    end
  end

  # define ability for admin
  def admin
    can [:new, :create], Group
    can :index, Group, id: Group.where(user_id: user.id).ids
    can [:show, :edit, :update], Group, user_id: user.id
  end
end
