class Utils
	def self.get_video_file_duration(inputFilename)
		command = "ffmpeg -i " + inputFilename.to_s + " 2>&1 | grep 'Duration' | cut -d ' ' -f 4 | sed s/,//"
		output = `#{command}`

		if output =~ /([\d][\d]):([\d][\d]):([\d][\d]).([\d]+)/
		  duration = (($1.to_i * 60 + $2.to_i) * 60 + $3.to_i)
		else
			duration = 0
		end

		return duration
	end
end
