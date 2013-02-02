class CreateStockMovements < ActiveRecord::Migration
  def change
    create_table :stock_movements do |t|

      t.timestamps
    end
  end
end
