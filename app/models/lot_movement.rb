class LotMovement < ActiveRecord::Base
  # attr_accessible :title, :body
  self.table_name = 'regLotMovements'

  belongs_to :test
  belongs_to :lot, class_name: 'LotDocument', foreign_key: 'acceptDocId', primary_key: 'rref'
  belongs_to :movementDoc, class_name: 'AbstractDocument', foreign_key: '_RecorderRRef', primary_key: 'rref'
  belongs_to :article, foreign_key: 'articleId'
end
