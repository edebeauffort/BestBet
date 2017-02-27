class CreatePools < ActiveRecord::Migration[5.0]
  def change
    create_table :pools do |t|
      t.string :title
      t.text :description
      t.float :stake
      t.date :closing_date
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
