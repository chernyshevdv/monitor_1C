class ArticlesTest < AbstractTest
  # attr_accessible :title, :body
  has_many :differences, class_name: 'ArticlesDifference', foreign_key: 'test_id'
end
