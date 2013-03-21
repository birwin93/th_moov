module EventsHelper
	def organize_by_date(events)
		list = []
		m = events.first.date.month
		d = events.first.date.day
		list_day = []
		events.each do |e|
			if e.date.month == m && e.date.day == d
				list_day << e
			else 
				list << list_day
				list_day = [e]
				m = e.date.month
				d = e.date.day
			end
		end

		return list
	end
	
end
