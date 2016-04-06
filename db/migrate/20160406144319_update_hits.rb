class UpdateHits < ActiveRecord::Migration
  def change

  	change_column_default :posts, :hits, 0
  	change_column_default :playgrounds, :hits, 0
  	change_column_default :ideas, :hits, 0
  	change_column_default :scraps, :hits, 0

  end
end
