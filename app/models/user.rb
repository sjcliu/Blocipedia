class User < ActiveRecord::Base
  enum role: [:admin, :standard, :premium]

  after_initialize do
    self.role ||= :standard
  end

  attr_reader :user, :wiki

  # def initialize(user, wiki)
  #   @user = user
  #   @wiki = wiki
  # end

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

# Makes wikis public when user downgrades from premium to standard
   def downgrade!
     self.role = "standard"
     self.save

     self.wikis.each do |wiki|
       wiki.update_attribute(:private, false)
     end

   end

end
