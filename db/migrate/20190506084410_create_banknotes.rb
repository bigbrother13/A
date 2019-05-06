class CreateBanknotes < ActiveRecord::Migration[5.2]
  def change
    create_table :banknotes do |t|
      t.integer :hundred
      t.integer :fifty
      t.integer :twenty
      t.integer :ten
      t.timestamps
    end
  end
end
