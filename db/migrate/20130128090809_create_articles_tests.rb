class CreateArticlesTests < ActiveRecord::Migration
  def change
    create_table :articles_tests do |t|

      t.timestamps
    end
  end
end
