class CreateAccounts < ActiveRecord::Migration
  def change
    create_table :accounts do |t|
      t.float :price
      t.string :salesman
      t.text :description
      t.integer :status
      t.references :customer, index: true, foreign_key: true

      t.timestamps 
    end
  end
end
