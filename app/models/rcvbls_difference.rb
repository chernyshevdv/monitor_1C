class RcvblsDifference < ActiveRecord::Base
  self.table_name = 'regReceivables'

  belongs_to :test, class_name: 'RcvblsTest'
  belongs_to :organization, primary_key: 'rref', foreign_key: 'organization'
  belongs_to :contractor, foreign_key: 'contractor'
  belongs_to :contract, foreign_key: 'contract'
  belongs_to :document, foreign_key: '_RecorderRRef', class_name: 'AbstractDocument', primary_key: 'rref'
end
