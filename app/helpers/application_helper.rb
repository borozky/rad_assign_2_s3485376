module ApplicationHelper
	def gravatar_image_url(email, thumbnail_size = 50)
		hashed = Digest::MD5.hexdigest(email.strip.downcase)
		return "https://www.gravatar.com/avatar/#{hashed}?s=#{thumbnail_size}"
	end
end
