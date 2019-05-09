class CreateVisitors < ActiveRecord::Migration[5.2]
  def change
    create_table :visitors do |t|
      t.string :title
      t.integer :banknote

      t.timestamps
    end
  end
end
