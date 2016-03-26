class ChargesController < ApplicationController
  def new

  end
  def create
     # Creates a Stripe Customer object, for associating
     # with the charge
     @amount = 1500

     customer = Stripe::Customer.create(
       :email => params[:stripeEmail],
       :source  => params[:stripeToken]
       )


     # Where the real magic happens
     charge = Stripe::Charge.create(
       :customer => customer.id, # Note -- this is NOT the user_id in your app
       :amount => @amount,
       :description => "Premium Membership - #{current_user.email}",
       :currency => 'usd'
     )
     #Upgrades User when payment goes through
     current_user.update_attribute(:role, "premium")


     flash[:notice] = "Thanks for all the money, #{current_user.email}! Feel free to pay me again."
     redirect_to wikis_path(current_user) # or wherever
   end
   


   # Stripe will send back CardErrors, with friendly messages
   # when something goes wrong.
   # This `rescue block` catches and displays those errors.
   rescue Stripe::CardError => e
     flash.now[:alert] = e.message
     redirect_to new_charge_path
   end
