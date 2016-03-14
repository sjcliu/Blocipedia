class ApplicationPolicy
  attr_reader :user, :wiki
  after_initialize do self.role ||= "standard" end

  def initialize(user, wiki)
    @user = user
    @wiki = wiki
  end

  def index?
    false
  end

  def admin
    @admin = admin
  end

  def standard
    @standard = standard
  end

  def premium
    @premium = premium
  end

  def set_as_admin
  self.role = USER_ROLES[:admin]
  end

  def set_as_standard
  self.role = USER_ROLES[:standard]
  end

  def set_as_premium
  self.role = USER_ROLES[:premium]
  end

  def admin?
    user.has_role?('Admin')
  end

  def standard?
    user.has_role?('Standard')
  end

  def premium?
    user.has_role?('premium')
  end

  def show?
    scope.where(:id => record.id).exists?
  end

  def create?
    false
  end

  def new?
    create?
  end

  def update?
    user.present?
  end

  def edit?
    update?
  end

  def destroy?
    false
  end

  def scope
    Pundit.policy_scope!(user, record.class)
  end



  class Scope
    attr_reader :user, :scope

    def initialize(user, scope)
      @user = user
      @scope = scope
    end

    def resolve
      scope
    end
  end
end
