class SfptuTest < AbstractTest
  has_many :differences, class_name: 'SfptuDifference', foreign_key: 'test_id', order: 'sfRRef'
end
