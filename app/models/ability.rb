class Ability
  include CanCan::Ability

  def initialize(user)

    user ||= User.new # guest user

    if user.rol == "kiVE7D9GNH+VJDkIvPOtOQ"
      can :manage, :all
    else
      can :read, :all
      if user.rol == "Empresa"
        can :create, Vacante
        can :update, Vacante do |vacante|
          vacante.try(:user) == user
        end
        can :destroy, Vacante do |vacante|
          vacante.try(:user) == user
        end

        can :update, Aplicacion do |aplicacion|
          aplicacion.vacante.user == user
        end

      elsif user.rol == "Practicante"
        can :create, Aplicacion
      end
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
    # https://github.com/ryanb/cancan/wiki/Defining-Abilities
  end
end
