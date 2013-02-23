class RcvblsTest < AbstractTest
  has_many :differences, class_name: 'RcvblsDifference', foreign_key: 'test_id'
end
