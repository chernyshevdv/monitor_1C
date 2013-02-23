class RcvblsTestsController < ApplicationController
	def index
		@rcvbls_tests = RcvblsTest.all
	end

	def show
		@rcvbls_test = RcvblsTest.find(params[:id])
	end
end
