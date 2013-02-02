class StockTestsController < ApplicationController
	def index
		@stock_tests = StockTest.where('tested=1')
	end

	def show
		@stock_test = StockTest.find(params[:id])
	end
end
