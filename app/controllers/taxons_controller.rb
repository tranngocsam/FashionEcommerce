class TaxonsController < Spree::BaseController
  rescue_from ActiveRecord::RecordNotFound, :with => :render_404
  helper :products
	before_filter :authenticate_user!

  respond_to :html

  def show
    @taxon = Taxon.find_by_permalink!(params[:id])
    return unless @taxon

    @searcher = Spree::Config.searcher_class.new(params.merge(:taxon => @taxon.id))
    @products = @searcher.retrieve_products
		@show_minor_nav = true

    respond_with(@taxon)
  end

  private

  def accurate_title
    @taxon ? @taxon.name : super
  end
end
