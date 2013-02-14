class NullarticlesTest < AbstractTest
  # attr_accessible :title, :body
  has_many :differences, class_name: 'NullarticlesDifference', foreign_key: 'test_id', order: 'doc_number'
  has_many :documents, through: :differences, uniq: true
end
