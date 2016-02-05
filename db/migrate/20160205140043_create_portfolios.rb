class CreatePortfolios < ActiveRecord::Migration
  def change
    create_table :portfolios do |t|

    	t.string :category
    	t.string :title
    	t.text :context
    	t.text :image
    	t.string :date
    	t.string :service

      t.timestamps null: false
    end
  end
end
