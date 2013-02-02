class StockDifferencesController < ApplicationController
	def index
		@stock_differences = @stock_test.differences
	end
end
