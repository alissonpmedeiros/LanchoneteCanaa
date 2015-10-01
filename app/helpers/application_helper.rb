module ApplicationHelper
	def status(status)
		if status 
			"Pago"
		else
			"Pendente"
		end
	end

	def total_bill(customer)
		result = 0
		customer.accounts.each do |account|
			unless account.status
				result += account.price
			end
		end
		result
	end
end
