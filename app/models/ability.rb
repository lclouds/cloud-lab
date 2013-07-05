class Ability
  include CanCan::Ability

  def initialize(user)
    # Define abilities for the passed in user here. For example:
    #
    alias_action :update, :destroy, :to => :modify
    alias_action :create, :read, :update, :destroy, :to => :crud
    puts 'current user ----'+user.class.to_s
    if user.class.to_s == 'User'
      user ||= User.new # guest user (not logged in)
      if user.admin?
        can :manage, :all
      else
        can :read, :all
      end
      can :read, Course
      can [:new, :create, :myclasses], User
      can :manage, User,  :id => user.id
      can [:index, :show, :apply], Clclass
      cannot :manage, Teacher
      
    elsif user.class.to_s == 'Teacher'
      user ||= Teacher.new # guest user (not logged in)
      
      can :manage, Teacher
      if user.admin?
        can :manage, :all
      else
        can :read, :all
      end
      can :read, Course
      can [:new, :create, :myclasses], User
      can :manage, User,  :id => user.id
      can [:index, :show, :apply], Clclass
      
    end
    
    
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
    # https://github.com/ryanb/cancan/wiki/Defining-Abilities
  end
end
