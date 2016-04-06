class CreateIdeas < ActiveRecord::Migration
  def change
    create_table :ideas do |t|

    	t.string :title
    	t.text :context
    	t.integer :hits
    	t.references :user, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
