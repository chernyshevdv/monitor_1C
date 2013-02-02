class LotsDifference < ActiveRecord::Base
  # attr_accessible :title, :body
  self.table_name = 'regLots'

  belongs_to :test, class_name: 'LotsTest'
  belongs_to :lot, class_name: 'AbstractDocument', primary_key: 'rref'
  belongs_to :article
end
