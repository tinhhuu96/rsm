class Ability
  include CanCan::Ability

  def initialize user, controller_namespace = nil
    if user.present?
      case controller_namespace
        when "Employers"
          can :manage, :all if user.employer? || user.admin?
        when ""
          can :read, :all
          can :update, User, id: user.id
        else
          if user.employer?
            if user.members.present?
              can :update, Company do |company|
                company.id == user.members.last.company_id && user.members.last.end_time.nil?
              end
            end
          elsif user.admin?
            can :manage, :all
          end
      end
    end
  end
end
