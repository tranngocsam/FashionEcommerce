class VideosController < Spree::BaseController
	layout "spree_application"

  # GET /videos
  # GET /videos.xml
  def index
		@latest_video = Video.find(:first, :order => "created_at DESC")
    @videos = Video.find(:all, :conditions => ["id != #{@latest_video.id}"], :order => "created_at DESC")

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
