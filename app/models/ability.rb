class Ability
  include CanCan::Ability

  def initialize(user)
    case user
    when Admin
      can :manage, :all
    when Teacher
      #to do
    when Student
      can :read, Question
      can :create, Answer, reference: false
      can :update, Answer, reference: false
      can :read, Answer
      can :create, Test
      can :read, Test, user_id: user.id
      can :destroy, Test, user_id: user.id
      can :create, Message
      can :read, Message, email: user.email
      can :manage, TestQuestion
    when Input
      can :create, Question
      can :update, Question
      can :destroy, Question
      can :read, Question
    end
    # Define abilities for the passed in user here. For example:
    #
    #   user ||= User.new # guest user (not logged in)
    #   if user.admin?
    #     can :manage, :all
    #   else
    #     can :read, :all
    #   end
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
    #   can :update, Article, :published => true
    #
    # See the wiki for details:
    # https://github.com/CanCanCommunity/cancancan/wiki/Defining-Abilities
  end
end
