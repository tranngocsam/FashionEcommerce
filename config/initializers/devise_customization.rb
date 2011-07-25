module Devise
  module Models
    module Validatable

	    def password_required?
      	false
    	end

    end
	end
end

Devise.setup do |config|
	config.confirm_within = 0
end
