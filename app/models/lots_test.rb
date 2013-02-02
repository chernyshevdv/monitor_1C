class LotsTest < AbstractTest
  # attr_accessible :title, :body
  has_many :differences, class_name: 'LotsDifference', foreign_key: 'test_id'
  has_many :movements, class_name: 'LotMovement', foreign_key: 'test_id', order: '_RecorderRRef'
  has_many :lots, class_name: 'LotDocument', through: :movements, uniq: true

end
