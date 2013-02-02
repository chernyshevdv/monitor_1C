class CreateLotDocuments < ActiveRecord::Migration
  def change
    create_table :lot_documents do |t|

      t.timestamps
    end
  end
end
