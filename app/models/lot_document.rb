class LotDocument < AbstractDocument
  # attr_accessible :title, :body
  self.inheritance_column = :_type_disabled

  has_many :movements, class_name: 'LotMovement', foreign_key: 'acceptDocId', primary_key: 'rref'
end
