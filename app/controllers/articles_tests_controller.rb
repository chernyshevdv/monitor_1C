class ArticlesTestsController < ApplicationController
	def index
		@articles_tests = ArticlesTest.where('tested=1')
	end

	def show
		@articles_test = ArticlesTest.find(params[:id])
	end
end
