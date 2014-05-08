class AgenciesController < ApplicationController
	require 'rest-client'



	def index
		@raw_xml = RestClient.get "http://services.my511.org/Transit2.0/GetAgencies.aspx?token=ENV['511_KEY']"
		@results = Hash.from_xml(@raw_xml)
	end
end
# @page = RestClient.get("http://services.my511.org/Transit2.0/GetAgencies.aspx?token=7eabc5bb-1999-4dc9-a7c5-feb57b7dfdce")

# results = Hash.from_xml(@page)

# # getting the names of all the agencies as an array
# puts results["RTT"]["AgencyList"]["Agency"]

# # getting the results for BART, the 1 index
# puts results["RTT"]["AgencyList"]["Agency"][1]

# # getting "BART" to print, use similar code to create menu items
# puts results["RTT"]["AgencyList"]["Agency"][1]["Name"]

# # getting 'HasDirection' value for BART
# puts results["RTT"]["AgencyList"]["Agency"][1]["HasDirection"]