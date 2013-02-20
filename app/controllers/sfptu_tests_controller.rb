class SfptuTestsController < ApplicationController
	def index
		@sfptu_tests = SfptuTest.all
	end

	def show
		@sfptu_test = SfptuTest.find(params[:id])
	end
end
