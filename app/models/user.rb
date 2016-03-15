class User < ActiveRecord::Base
  enum role: [:admin, :standard, :premium]

  after_initialize do
    self.role ||= :standard
  end

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable

   def set_as_admin
   self.role = :admin
   end

   def set_as_standard
   self.role = :standard
   end

   def set_as_premium
   self.role = :premium
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

end
