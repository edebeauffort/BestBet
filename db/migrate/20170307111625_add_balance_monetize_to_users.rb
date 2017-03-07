class AddBalanceMonetizeToUsers < ActiveRecord::Migration[5.0]
  def change
    add_monetize :users, :balance, currency: { present: false }
  end
end
