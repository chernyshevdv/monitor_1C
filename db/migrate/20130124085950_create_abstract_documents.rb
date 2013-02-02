class CreateAbstractDocuments < ActiveRecord::Migration
  def change
    create_table :abstract_documents do |t|

      t.timestamps
    end
  end
end
