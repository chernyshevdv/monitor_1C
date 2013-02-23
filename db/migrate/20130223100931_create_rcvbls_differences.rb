class CreateRcvblsDifferences < ActiveRecord::Migration
  def change
    create_table :rcvbls_differences do |t|

      t.timestamps
    end
  end
end
