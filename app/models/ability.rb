class Ability
  include CanCan::Ability

  def initialize(user)
    if user.admin?
      can :manage, Post
      can :read, User
      can :manage, User, id: user.id
      can :read, ActiveAdmin::Page, name: "Dashboard", namespace_name: "admin"
    elsif user.operator?
      can :read, ActiveAdmin::Page, name: "Dashboard", namespace_name: "admin"
      can :manage, DeviceInfo
    end
  end

end