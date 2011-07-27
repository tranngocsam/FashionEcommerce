class UserMailer < ActionMailer::Base
  default :from => "from@example.com"

	def disapprove(user)
		@user = user
		mail(:to => user.email, :subject => "Your account has been disabled")
	end

	def approve(user)
		@user = user
		mail(:to => user.email, :subject => "Your account has been enabled")
	end

	def welcome(user, password)
		@user = user
		@password = password
		mail(:to => user.email, :subject => "Welcome to fashion shop")
	end
end
