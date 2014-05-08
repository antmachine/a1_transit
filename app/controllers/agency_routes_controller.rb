class AgencyRoutesController < ApplicationController

	def index
		@raw_xml = RestClient.get("http://services.my511.org/Transit2.0/GetRoutesForAgency.aspx?token=#{ENV['511_KEY']}&agencyName=#{params[:agency]}")
		@route_results = Hash.from_xml(@raw_xml)
	end

	# def stops
	# 	@raw_xml = 
	# end

end
