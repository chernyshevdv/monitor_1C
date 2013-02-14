# encoding: utf-8
class Stock < ActiveRecord::Base
  # attr_accessible :title, :body
  self.table_name = 'metaStocks'
  # self.primary_key = 'stockId'

  has_many :differences, foreign_key: 'stock_id', class_name: 'StockDifference', primary_key: 'stockId'
  has_many :documents, through: :differences, uniq: true

  has_many :tests, class_name: 'AbstractTest', primary_key: 'stockId', conditions: 'is_current=1'

  def title
  	cmpTitle
  end

  def tests_ok?
  	ok = true
  	tests.each do |t|
  		ok = false if !t.ok?
  	end

  	ok
  end

end
