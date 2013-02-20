class CreateSfptuTests < ActiveRecord::Migration
  def change
    create_table :sfptu_tests do |t|

      t.timestamps
    end
  end
end
