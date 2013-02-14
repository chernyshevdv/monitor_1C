class CreateNullarticlesTests < ActiveRecord::Migration
  def change
    create_table :nullarticles_tests do |t|

      t.timestamps
    end
  end
end
