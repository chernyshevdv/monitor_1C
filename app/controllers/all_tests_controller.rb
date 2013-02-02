class AllTestsController < ApplicationController
	def index
		@abstract_tests = AbstractTest.where('tested=1').order('id')
	end

	def show
		@test = AbstractTest.find(params[:id])
	end
end
