class AgenciesController < ApplicationController

	#Choose an agency from a real-time list of running agencies
	def index
		@raw_xml = RestClient.get("http://services.my511.org/Transit2.0/GetAgencies.aspx", :params => {:token => ENV['511_KEY']})
		@results = Hash.from_xml(@raw_xml)
	end

end