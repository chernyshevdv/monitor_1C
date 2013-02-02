class AbstractDocumentsController < ApplicationController
	def destroy
		doc = AbstractDocument.find(params[:id])
		doc.fixed = 1
		doc.save

		redirect_to request.referer
	end
end
