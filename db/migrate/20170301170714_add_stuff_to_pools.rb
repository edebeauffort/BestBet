class AddStuffToPools < ActiveRecord::Migration[5.0]
  def change
    add_reference :pools, :selection, foreign_key: true
  end
end
