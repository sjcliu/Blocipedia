class User < ActiveRecord::Base
  enum role: [:admin, :standard, :premium]

  after_initialize do
    self.role ||= :standard
  end

  attr_reader :user, :wiki

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable
end
