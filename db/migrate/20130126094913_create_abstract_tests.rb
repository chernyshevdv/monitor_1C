class CreateAbstractTests < ActiveRecord::Migration
  def change
    create_table :abstract_tests do |t|

      t.timestamps
    end
  end
end
