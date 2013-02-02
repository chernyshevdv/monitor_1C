class StockTest < AbstractTest
  # attr_accessible :title, :body
  
  has_many :differences, class_name: 'StockDifference', foreign_key: 'test_id'
  has_many :movements, class_name: 'StockMovement', foreign_key: 'test_id'
  has_many :stocks, through: :differences, uniq: true
  has_many :documents, through: :movements, conditions: 'fixed=0', uniq: true
end
