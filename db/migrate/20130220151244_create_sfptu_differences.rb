class CreateSfptuDifferences < ActiveRecord::Migration
  def change
    create_table :sfptu_differences do |t|

      t.timestamps
    end
  end
end
