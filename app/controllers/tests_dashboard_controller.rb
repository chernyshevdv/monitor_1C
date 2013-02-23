# encoding: utf-8
class TestsDashboardController < ApplicationController
	def index
		@articles_tests = ArticlesTest.where('tested=1').order('id')
		@stock_tests = StockTest.where('tested=1').order('id')
		@lots_tests = LotsTest.where('tested=1').order('id')
		@sfptu_tests = SfptuTest.where('tested=1 AND is_current=1').order('id')
		@rcvbls_tests = RcvblsTest.where('is_current=1').order('id')
		@all_tests = AbstractTest.where('tested=1').order('id')

		@stocks = Stock.all
		@organizations = Organization.where('orgAbbr IS NOT NULL').order('orgTitle')
	end
end
