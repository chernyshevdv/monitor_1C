class Organization < ActiveRecord::Base
  self.table_name = 'metaOrganizations'

  has_many :tests, class_name: 'AbstractTest', foreign_key: 'organization_id'
  has_many :rcvbls_tests
  has_many :differences, through: :rcvbls_tests

  def title
  	orgTitle
  end
end
