class Ability
  include CanCan::Ability

  def initialize(user)
    can :read, :all
    if user.present?
      if user.employer?
        if user.members.present?
          can :update, Company do |company|
            company.id == user.members.last.company_id && user.members.last.end_time.nil?
          end
        end
      else user.admin?
        can :manage, :all
      end
      can :read, :all
      can :manage, Achievement, user_id: user.id
      can :manage, Club, user_id: user.id
      can :update, User, id: user.id
    end
  end
end

