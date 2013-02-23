class CreateRcvblsTests < ActiveRecord::Migration
  def change
    create_table :rcvbls_tests do |t|

      t.timestamps
    end
  end
end
