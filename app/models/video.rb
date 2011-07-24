require "utils"

class Video < ActiveRecord::Base
	has_attached_file :movie, 
										:styles => { :small    => '195x195#',
                                 :medium   => '515x515#',
                                 :large    => '365x365#' },
										#:url => '/:class/:id/:style.:content_type_extension',
                    #:path => ':rails_root/assets/:id_partition/:style.:content_type_extension',
										:processors => [:video_thumbnail]

	validates_attachment_presence :movie
	validates_attachment_content_type :movie, :content_type => ['application/x-shockwave-flash', 
																															'application/x-shockwave-flash', 
																															'application/flv', 
																															'video/x-flv', 
																															'application/x-mp4', 
																															'video/mpeg', 
																															'video/quicktime', 
																															'video/mp4', 
																															'video/mpeg4', 
																															'video/mpeg4-generic']
	before_save :set_duration

	def set_duration
		self.duration = Utils.get_video_file_duration(self.movie.path)
	end
end
