class Article < ActiveRecord::Base
  # attr_accessible :title, :body
  self.table_name = 'vwArticles'
  self.primary_key = 'id'

  def rref_bin()
  	"0x#{id.unpack('H*').join}"
  end
end
