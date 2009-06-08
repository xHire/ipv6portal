# coding: utf-8
class Database::ProvidersController < Database::BaseController
	before_filter :select_category

	def list
		# title
		@title = 'Databáze '
		case params['type']
			when 'isp'
				@title += 'ISP'
			when 'serverhousing'
				@title += 'serverhousingů'
			when 'webhosting'
				@title += 'webhostingů'
			else
				@title = 'Chyba'
				@providers = nil
				return
		end

		# data for listing
		@providers = Object.module_eval("::#{params['type'].camelize}", __FILE__, __LINE__).all
	end

	private
	def select_category
		@selected_category = params['type']
	end
end
