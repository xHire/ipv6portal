# coding: utf-8
class Database::ProvidersController < Database::BaseController
	before_filter :select_category

	private
	def select_category
		@selected_category = params['type']
	end
end
