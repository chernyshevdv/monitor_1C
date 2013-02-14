class NullarticlesTestsController < ApplicationController
	def show
		@nullarticles_test = NullarticlesTest.find(params[:id])
	end
end
