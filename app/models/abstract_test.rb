class AbstractTest < ActiveRecord::Base
  # attr_accessible :title, :body
  self.table_name = 'docTests'

  belongs_to :stock

  def ok?
  	differences.count == 0
  end
end
