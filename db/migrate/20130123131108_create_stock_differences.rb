class CreateStockDifferences < ActiveRecord::Migration
  def change
    create_table :stock_differences do |t|

      t.timestamps
    end
  end
end
