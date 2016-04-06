class CreateScraps < ActiveRecord::Migration
  def change
    create_table :scraps do |t|

    	t.string :title
    	t.text :url
    	t.text :context
    	t.integer :hits
    	t.references :user, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
