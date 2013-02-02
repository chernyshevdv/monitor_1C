class StockMovement < ActiveRecord::Base
  # attr_accessible :title, :body
  self.table_name = 'regStockMovements'
  
  belongs_to :difference, class_name: 'StockDifference', foreign_key: [:stock_id, :article_id], primary_key: [:stock_id, :article_id]
  belongs_to :stock
  belongs_to :article
  belongs_to :test, class_name: 'StockTest'
  belongs_to :document, class_name: 'AbstractDocument', foreign_key: '_RecorderRRef', primary_key: 'rref'

  def render_article
  	if !article.nil? 
  		"#{article.code} #{article.title}"
  	else
  		"[#{article_id}]"
  	end
  end

end
