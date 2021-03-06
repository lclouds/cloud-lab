class Ability
  include CanCan::Ability
  def initialize(user)
    # Define abilities for the passed in user here. For example:
    #
    alias_action :update, :destroy, :to => :modify
    alias_action :create, :read, :update, :destroy, :to => :crud
    can :access, :ckeditor
    can [:read, :create, :destroy], Ckeditor::Picture
    can [:read, :create, :destroy], Ckeditor::AttachmentFile
    puts 'current user -----------'+user.class.to_s
    if user.class.to_s == 'Teacher'

      can :manage, Teacher, :id => user.id
      can :read, :all
      can :read, Teacher
      can :manage, Course
      can [:new, :create,:index, :show], Clclass
      can :manage, Lecture
      can :manage, Exercise
      can :manage, Team
    else
      user ||= User.new # guest user (not logged in)
      if user.admin?
        can :manage, :all
      else
        can :read, :all
        #      cannot :manage, Teacher
        #      can :manage, Teacher
        can [:index],Teacher
      end
      can [:index,:show,:join,:leave,:show_team],Team
      can :read, Course
      can :manage,Course
      can [:read,:show_video], Lecture
#      can :manage, Lecture
      can [:reports,:new_report,:show_report,:show_reports,:destroy_report], Exercise
#      can :manage, Exercise
      can [:new, :create, :myclasses,:search_user], User
      can :manage, User,  :id => user.id
      can [:index, :show, :apply], Clclass
#      can :manage,Clclass
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

