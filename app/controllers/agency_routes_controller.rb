class AgencyRoutesController < ApplicationController

# TODO find out why %20 is in params, but removed when passed to method.
	def index
		# Manually encode the params to avoid errors with spaces and such.
		@raw_xml = RestClient.get("http://services.my511.org/Transit2.0/GetRoutesForAgency.aspx", :params => {:token => ENV['511_KEY'], :agencyName => params[:agency]})
		@route_results = Hash.from_xml(@raw_xml)
	end

	def stops
		# TODO stops for routes use route code and direction
		# TODO check to see how to pull "route name" and "direction code" from params
		# TODO error checking for routes that have a direction OR just choose a single agency to work with
	end

	def choose_direction
		# TODO only present this choice if the route has a direction
		# TODO grab different params based on direction chosen OR capture first param and pass to next method
		@user_route = #RestClientCall with :routeCode?
		if @user_route["HasDirection"] == True # TODO check for string or literal boolean
			# TODO do a console API call to see how the direction param affects the results
			# TODO send to show page for choosing direction
		else
			# TODO send to index page for routes with this agency
		end
	end

	def start_stop_station
		# TODO User can pick a start and stop station and get all departing options
	end

	def times
		# TODO User can pick a date/ time and get all running services?
	end


end
