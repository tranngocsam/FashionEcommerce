class HomeController < Spree::BaseController
	layout "spree_application"

	def index
		render :layout => "no-frame";
	end

	def flash_xml
		taxonomies = get_taxonomies()
		@collections = {}
		taxonomies.each do |taxonomy|
			taxonomy.root.children.each do |taxon|
				products = taxon.products.active.all
				@collections[taxon.id] = products
			end
		end

		respond_to do |format|
			format.xml
		end
	end
end
