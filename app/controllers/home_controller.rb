class HomeController < Spree::BaseController
	layout "spree_application"

	def index
		render :layout => "no-frame";
	end
end
