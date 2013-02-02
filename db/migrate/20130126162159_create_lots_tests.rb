class CreateLotsTests < ActiveRecord::Migration
  def change
    create_table :lots_tests do |t|

      t.timestamps
    end
  end
end
