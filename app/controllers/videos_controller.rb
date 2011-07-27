class VideosController < Spree::BaseController
	layout "spree_application"

  # GET /videos
  # GET /videos.xml
  def index
		@latest_video = Video.find(:first, :order => "created_at DESC")
		options = {
			:page => params[:page] || 1,
			:per_page => 10,
			:order    => params[:sort].blank? ? "created_at DESC" : params[:sort]
		}
		options[:conditions] = ["id != #{@latest_video.id}"]
    @videos = Video.paginate(options)

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @videos }
    end
  end

  # GET /videos/1
  # GET /videos/1.xml
  def show
    @video = Video.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @video }
    end
  end
end
