class CreateLotMovements < ActiveRecord::Migration
  def change
    create_table :lot_movements do |t|

      t.timestamps
    end
  end
end
