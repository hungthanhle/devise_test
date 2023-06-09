# frozen_string_literal: true

class Ability
  include CanCan::Ability

  def initialize(user)
    # Define abilities for the user here. For example:
    #
    #   return unless user.present?
    #   can :read, :all
    #   return unless user.admin?
    #   can :manage, :all
    #
    # The first argument to `can` is the action you are giving the user
    # permission to do.
    # If you pass :manage it will apply to every action. Other common actions
    # here are :read, :create, :update and :destroy.
    #
    # The second argument is the resource the user can perform the action on.
    # If you pass :all it will apply to every resource. Otherwise pass a Ruby
    # class of the resource.
    #
    # The third argument is an optional hash of conditions to further filter the
    # objects.
    # For example, here the user can only update published articles.
    #
    #   can :update, Article, published: true
    #
    # See the wiki for details:
    # https://github.com/CanCanCommunity/cancancan/blob/develop/docs/define_check_abilities.md

    # CanCanCan automatically adds some convenient aliases for mapping the controller actions
    # read: [:index, :show]
    # create: [:new, :create]
    # update: [:edit, :update]
    # destroy: [:destroy]

    return unless user.present?
    can [:read, :update, :destroy], User, :id => user.id
    # user = current_user
    # :id = @user.id

    #https://github.com/CanCanCommunity/cancancan/blob/develop/docs/define_check_abilities.md
    # return unless user.admin? 
    return unless user.role == "admin"
    can :manage, User
    # can :manage, :all

    if user.role == "admin"
      can :admin, StaticPagesController 
    end
    
  end
end
