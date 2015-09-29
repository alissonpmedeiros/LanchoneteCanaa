module ApplicationHelper
	def status(status)
		if status 
			"Pago"
		else
			"Pendente"
		end
	end
end
