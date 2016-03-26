class UsersController < ApplicationController
  # Makes wikis public when user downgrades from premium to standard
  def downgrade
    @user = current_user
    @user.update_attributes(role: 'standard')

    if @user.save
        flash[:notice] = "Account downgraded to 'Standard'"
        redirect_to wikis_path

        @user.wikis.each do |wiki|
          wiki.update_attribute(:private, false)
          end
    else
        flash[:error] = "Could not downgrade your account"
    end
  end

end
