class AgenciesController < ApplicationController

	#Choose an agency from a real-time list of running agencies
	def index_of_agencies
		@raw_xml_agencies = RestClient.get("http://services.my511.org/Transit2.0/GetAgencies.aspx", :params => {:token => ENV['511_KEY']})
		@agencies_list = Hash.from_xml(@raw_xml_agencies)
	end

	def list_routes_for_agency
		@raw_xml_routes = RestClient.get("http://services.my511.org/Transit2.0/GetRoutesForAgency.aspx", :params => {:token => ENV['511_KEY'], :agencyName => params[:agency]})
		@agency_route_results = Hash.from_xml(@raw_xml_routes)

		if @agency_route_results["RTT"]["AgencyList"]["Agency"]["HasDirection"] == "True"
			route_with_direction(APICall)
		elsif @agency_route_results["RTT"]["AgencyList"]["Agency"]["HasDirection"] == "False"
			route_no_direction(APICall)
		# TODO find out how many/ what directions are used by each route with a direction
		else
			puts "ERROR!"
		end
	end

	def route_no_direction
		@raw_xml_stops_no_d = RestClient.get("http://services.my511.org/Transit2.0/GetStopsForRoute.aspx", :params => {:token => ENV['511_KEY'], :routeIDF => "#{params[:agency]}~#{params[:code]}"})
		@stops_no_d = Hash.from_xml(@raw_xml_stops_no_d)
		# redirect to route_no_direction.html.erb?
		# binding.pry
	end

	def route_with_direction
		# @raw_xml_stops_with_d = RestClient.get("http://services.my511.org/Transit2.0/GetStopsForRoute.aspx", :params =>
	end
end
# http://services.my511.org/Transit2.0/GetStopsForRoute.aspx?token=123-456- 789&routeIDF=AgencyName~RouteCode~RouteDirectionCode.
