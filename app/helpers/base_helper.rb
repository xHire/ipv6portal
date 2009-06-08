module BaseHelper
	def list_wiki_categories
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

			output += "<li#{cls}>" + link_to(c[:title], wiki_path(c[:id])) + "</li>\n"
		end

		return output
	end
end
