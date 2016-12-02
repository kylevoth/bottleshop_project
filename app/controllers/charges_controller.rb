class ChargesController < ApplicationController
  def new
    @amount = 500
    @description = 'Purchase of all cart items.'
  end

  def create
  # Amount in cents
  amount = 500

  @customer = Stripe::Customer.create(
    :email => params[:stripeEmail],
    :source  => params[:stripeToken]
  )

  @charge = Stripe::Charge.create(
    :customer    => @customer.id,
    :amount      => amount,
    :description => 'Rails Stripe customer',
    :currency    => 'cad'
  )

  rescue Stripe::CardError => e
    flash[:error] = e.message
    redirect_to new_charge_path
  end
end
