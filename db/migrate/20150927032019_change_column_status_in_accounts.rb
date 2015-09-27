class ChangeColumnStatusInAccounts < ActiveRecord::Migration
  def change
  	change_column :accounts, :status, :boolean, default: false
  end
end
