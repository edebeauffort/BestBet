class CreateOrders < ActiveRecord::Migration[5.0]
  def change
    create_table :orders do |t|
      t.string :state
      t.references :user, foreign_key: true
      t.monetize :balance, currency: { present: false }
      t.json :payment

      t.timestamps
    end
  end
end
