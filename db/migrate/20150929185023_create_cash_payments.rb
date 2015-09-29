class CreateCashPayments < ActiveRecord::Migration
  def change
    create_table :cash_payments do |t|
      t.string :salesman
      t.float :price
      t.text :description

      t.timestamps
    end
  end
end
