class MainController < ApplicationController
require 'rest-client'

	def show_all
		@show_all = RestClient.get "http://services.my511.org/Transit2.0/GetAgencies.aspx?token=7eabc5bb-1999-4dc9-a7c5-feb57b7dfdce"
		render @show_all
		render text: "Win!"

	end







end
