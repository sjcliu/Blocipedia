class WikiPolicy < ApplicationPolicy

  def index?
    @user.present?
  end
  def show?
    if @wiki.private
      if @user.role == 'premium'
          return true
      else
        # flash[:alert] = "You must be signed in to view premium member wikis."
        return false
      end
    else
      return true
    end
  end

# Makes private disappear for standard and not logged in user.
  class Scope < Scope
    def resolve
      if @user && @user.role == 'premium'
        scope.all
      else
        scope.where(private: false)
      end
    end
  end

end
