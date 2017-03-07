class OrdersController < ApplicationController

  def create
    order  = Order.create!(user: current_user, balance: params[:balance], state: 'pending')
    #IF I WANT TO CHANGE THE DEPOSIT FOR AN INPUT INSTEAD OF 0€ THE FIELD I NEED TO CHANGE IS balance: current_user.balance
    redirect_to new_order_payment_path(order)
  end

  def show
    @order = Order.where(state: 'paid').find(params[:id])
  end

end
