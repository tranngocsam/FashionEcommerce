host_url = "http://" + request.host_with_port
xml = Builder::XmlMarkup.new
xml.instruct!
xml.collections do
	@collections.each do |taxon_id, products|
		taxon = Taxon.find(taxon_id)
		collection_name = taxon.name + " " + taxon.parent.name
		xml.collection do 
			xml.name collection_name
			xml.url host_url + seo_url(taxon)
			xml.images do
				products.each do |product|
					#xml.product do
						#xml.name product.name
						#xml.description product.description
						#xml.url host_url + product_path(product)
						#xml.images do
							product.images.each do |image|
								xml.image do
									xml.thumbnail host_url + image.attachment.url(:product)
									xml.small host_url + image.attachment.url(:mini)
									xml.url host_url + product_path(product)
								end
							end
						#end
					#end
				end
			end
		end
	end
end
