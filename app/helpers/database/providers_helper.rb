module Database::ProvidersHelper
	def status_string status
		case status
			when 1
				'podporuje'
			when 2
				'v plánu'
			when 3
				'bez zájmu'
			else
				'???'
		end
	end
end
