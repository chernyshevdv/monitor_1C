class CreateNullarticlesDifferences < ActiveRecord::Migration
  def change
    create_table :nullarticles_differences do |t|

      t.timestamps
    end
  end
end
