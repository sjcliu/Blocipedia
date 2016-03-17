class UsersController < ApplicationController
  def initialize(user, wiki)
    @user = user
    @wiki = wiki
  end

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
