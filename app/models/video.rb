class Video < ActiveRecord::Base
	has_attached_file :movie, 
										:styles => { :small    => '36x36#',
                                 :medium   => '72x72#',
                                 :large    => '115x115#' },
										#:url => '/:class/:id/:style.:content_type_extension',
                    #:path => ':rails_root/assets/:id_partition/:style.:content_type_extension',
										:processors => [:video_thumbnail]

	validates_attachment_presence :movie
	validates_attachment_content_type :movie, :content_type => ['application/x-shockwave-flash', 'application/x-shockwave-flash', 'application/flv', 'video/x-flv']
end
