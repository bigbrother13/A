class CreateBanknotes < ActiveRecord::Migration[5.2]
  def change
    create_table :banknotes do |t|
      t.string :name
      t.integer :quantity
      t.timestamps
    end
  end
end
