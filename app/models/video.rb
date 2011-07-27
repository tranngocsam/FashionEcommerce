require "utils"

class Video < ActiveRecord::Base
	has_attached_file :movie, 
										:styles => { :small    => '195x195#',
                                 :medium   => '365x365#',
                                 :large    => '515x515#' },
										:url => '/:class/:id/:style.:content_type_extension',
                    :path => ':rails_root/public/movies/:id/:style.:content_type_extension',
										:processors => lambda{ |a| a.video? ? [:video_thumbnail] : [:thumbnail] }

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

	def video?
		[ 'application/x-mp4',
		'video/mpeg',
		'video/quicktime',
		'video/x-la-asf',
		'video/x-ms-asf',
		'video/x-msvideo',
		'video/x-sgi-movie',
		'video/x-flv',
		'flv-application/octet-stream',
		'video/3gpp',
		'video/3gpp2',
		'video/3gpp-tt',
		'video/BMPEG',
		'video/BT656',
		'video/CelB',
		'video/DV',
		'video/H261',
		'video/H263',
		'video/H263-1998',
		'video/H263-2000',
		'video/H264',
		'video/JPEG',
		'video/MJ2',
		'video/MP1S',
		'video/MP2P',
		'video/MP2T',
		'video/mp4',
		'video/MP4V-ES',
		'video/MPV',
		'video/mpeg4',
		'video/mpeg4-generic',
		'video/nv',
		'video/parityfec',
		'video/pointer',
		'video/raw',
		'video/rtx' ].include?(movie.content_type)
	end

	def set_duration
		self.duration = Utils.get_video_file_duration(self.movie.path)
	end
end
