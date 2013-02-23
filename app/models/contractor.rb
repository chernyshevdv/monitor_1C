class Contractor < ActiveRecord::Base
  self.table_name = 'vwContractors'
  self.primary_key = '_IDRRef'

  has_many :contracts

  def code()
  	_Code
  end

  def title()
  	_Description
  end
end
