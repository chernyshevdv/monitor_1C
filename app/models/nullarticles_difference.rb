class NullarticlesDifference < ActiveRecord::Base
  self.table_name = 'docWithNullArticles'

  belongs_to :test, class_name: 'NullarticlesTest', foreign_key: 'test_id'
  belongs_to :document, foreign_key: 'doc_rref', class_name: 'AbstractDocument', primary_key: 'rref'
end
