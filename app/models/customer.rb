class Customer < ActiveRecord::Base
	has_many :accounts, dependent: :delete_all

	def self.pay_off(customer)
		customer.accounts.update_all(status: 'true')
	end
end
