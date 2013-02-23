class Contract < ActiveRecord::Base
  self.table_name = 'vwContracts'
  self.primary_key = '_IDRRef'

  belongs_to :contractor

  def code()
  	_Code
  end

  def title()
  	_Description
  end
end
