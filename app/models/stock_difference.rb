# encoding: utf-8
class StockDifference < ActiveRecord::Base
  # attr_accessible :title, :body
  self.table_name = 'regStock'
  self.primary_key = 'id'

  belongs_to :stock, primary_key: 'stockId'
  belongs_to :article
  belongs_to :test, class_name: 'StockTest'
  has_many :movements, class_name: 'StockMovement', primary_key: [:stock_id, :article_id], foreign_key: [:stock_id, :article_id]
  has_many :documents, through: :movements, uniq: true
end
