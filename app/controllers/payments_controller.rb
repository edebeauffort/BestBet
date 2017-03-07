class PaymentsController < ApplicationController

  before_action :set_order

  def new
  end

  def create
    customer = Stripe::Customer.create(
      source: params[:stripeToken],
      email:  params[:stripeEmail]
    )

    charge = Stripe::Charge.create(
      customer:     customer.id,   # You should store this customer id and re-use it.
      amount:       @order.balance_cents, # or amount_pennies
      description:  "Payment for deposit in #{current_user} account for order #{@order.id}",
      currency:     @order.balance.currency
    )

    @order.update(payment: charge.to_json, state: 'paid')

    #Here we increment the user's balance with the amount payed
    @user = current_user
    @user.balance += @order.balance
    @user.save

    redirect_to order_path(@order)

  rescue Stripe::CardError => e
  flash[:error] = e.message
  redirect_to new_order_payment_path(@order)



  end

private

  def set_order
    @order = Order.where(state: 'pending').find(params[:order_id])
  end

end
