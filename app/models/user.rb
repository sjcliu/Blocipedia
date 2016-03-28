class User < ActiveRecord::Base
  has_many :wikis
  has_many :collaborators
  has_many :collaborator_wikis, through: :collaborators, source: :wiki
  enum role: [:standard,:admin, :premium]

  after_initialize do
    self.role ||= :standard
  end

  attr_reader :user, :wiki

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

   def edit
     self.downgrade!
   end
end
