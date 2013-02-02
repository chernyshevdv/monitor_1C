class CreateArticlesDifferences < ActiveRecord::Migration
  def change
    create_table :articles_differences do |t|

      t.timestamps
    end
  end
end
