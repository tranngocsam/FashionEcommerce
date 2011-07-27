require 'paperclip_processors/video_thumbnail'

Paperclip.interpolates :content_type_extension do |attachment, style_name|
  case
  when ((style = attachment.styles[style_name]) && !style[:format].blank?) then style[:format]
  when attachment.instance.video? && style_name.to_s == 'transcoded' then 'flv'
  when attachment.instance.video? && style_name.to_s != 'original' then 'jpg'
  else
    File.extname(attachment.original_filename).gsub(/^\.+/, "")
  end
end

=begin
module Paperclip
	class Attachment
		def width(style = default_style)
			Paperclip::Geometry.from_file(to_file(style)).width
		end

		def height(style = default_style)
			Paperclip::Geometry.from_file(to_file(style)).height
		end

		def image?(style = default_style)
			to_file(style).image?
		end
	end

	module Upfile
		def image?
			["image/jpeg", "image/tiff", "image/png", "image/gif", "image/bmp"].include?(content_type)
		end
	end
end
=end
