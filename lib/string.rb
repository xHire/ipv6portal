class String
	def seolize
		self.mb_chars.downcase.mb_chars.normalize(:kd).gsub(/[\s_.]+/, '-').gsub(/-+/, '-').gsub(/[^-a-z0-9~;+=_]/, '').gsub(/^-/, '').gsub(/-$/, '')
	end
end
