module TripsHelper
	def trip_sum
		@price_there = @trip.aviasalers.select { |aviasaler| aviasaler.price if aviasaler.back_side == true }
		@price_back = @trip.aviasalers.select { |aviasaler| aviasaler.price if aviasaler.back_side == false }
		@hotel_four = @trip.hotelsalers.select { |hotelsaler| hotelsaler.price if telsaler.five_stars == false }
  	end
end
