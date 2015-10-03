class Customer < ActiveRecord::Base
	has_many :accounts, dependent: :delete_all

	#scope :search, ->(query) { where("name like ?", "%#{query}%") }

	#def self.search(query)
	#	where("name like ?", "%#{query}%")
	#end

	def self.pay_off(customer)
		customer.accounts.update_all(status: 'true')
	end
end
