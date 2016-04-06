class AddColumnToUsers < ActiveRecord::Migration
  def change
    add_column :users, :name, :string
    add_column :users, :profile, :text
  	add_column :users, :team, :string
  	add_column :users, :member, :boolean, :default => false
  	add_column :users, :admin, :boolean, :default => false
  end
end
