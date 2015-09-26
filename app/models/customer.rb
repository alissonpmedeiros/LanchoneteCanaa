class Customer < ActiveRecord::Base
	has_many :accounts, dependent: :delete_all
end
