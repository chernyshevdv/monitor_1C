class ArticlesDifference < ActiveRecord::Base
  # attr_accessible :title, :body
  self.table_name = 'refArticles'

  belongs_to :test, class_name: 'ArticlesTest'
  # belongs_to :article
  belongs_to :article, foreign_key: 'rref'

end
