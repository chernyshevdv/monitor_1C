class SfptuDifference < ActiveRecord::Base
  self.table_name = 'regPtuSfDifferences'

  belongs_to :test, class_name: 'SfptuTest', foreign_key: 'test_id'
  belongs_to :sfDoc, class_name: 'AbstractDocument', foreign_key: 'sfRRef', primary_key: 'rref'
  belongs_to :ptuDoc, class_name: 'AbstractDocument', foreign_key: 'ptuRRef', primary_key: 'rref'

end
