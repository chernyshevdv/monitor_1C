class CreateLotsDifferences < ActiveRecord::Migration
  def change
    create_table :lots_differences do |t|

      t.timestamps
    end
  end
end
