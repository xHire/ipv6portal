module Database::BaseHelper
	def list_db_categories
		output = ''

		for c in @categories
			cls = ''
			if c[:id] == @selected_category
				cls += "active"
			elsif @categories[@categories.size - 1] == c
				cls += " " unless cls.empty?
				cls += "last"
			end
			cls = " class=\"#{cls}\"" unless cls.empty?

			output += "<li#{cls}>" + link_to(c[:title], url_for(:controller => "database/#{c[:type]}", :action => 'list', :type => c[:id])) + "</li>\n"
		end

		return output
	end
end
