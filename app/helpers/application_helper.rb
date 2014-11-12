module ApplicationHelper
	def date_format(date)
		unless date.blank?
			date.strftime("%B %e, %Y")
		end
	end
end
