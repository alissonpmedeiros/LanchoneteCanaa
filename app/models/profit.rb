class Profit < ActiveRecord::Base
	def self.total_sales(accounts)
	  result = 0
	  accounts.each do |account|
	    result += account.price
	  end
	  result
	end

	def self.total_collected(accounts)
	  result = 0
	  accounts.each do |account|
	  	if account.status
	  		result += account.price
	  	end
	  end
	  result
	end

	def self.total_spun(accounts)
	  result = 0
	  accounts.each do |account|
	  	unless account.status
	  		result += account.price
	  	end
	  end
	  result
	end

	def self.total_purchases(purchases)
	  result = 0
	  purchases.each do |purchase|
	  	result += purchase.price
	  end
	  result
	end
end
