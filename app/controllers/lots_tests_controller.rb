class LotsTestsController < ApplicationController
	def index
		@lots_tests = LotsTest.where('tested=1').order('id')
	end

	def show
		@lots_test = LotsTest.find(params[:id])
	end
end
