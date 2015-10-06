class CreatePurchases < ActiveRecord::Migration
  def change
    create_table :purchases do |t|
      t.float :price
      t.text :description

      t.timestamps
    end
  end
end
