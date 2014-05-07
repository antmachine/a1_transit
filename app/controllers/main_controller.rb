class MainController < ApplicationController
require 'rest-client'

	def show_all
		show_all = RestClient.get "http://services.my511.org/Transit2.0/GetAgencies.aspx?token=#{ENV[511_KEY]}"
		puts show_all
	end







end
