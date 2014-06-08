class AddSidebarToUsers < ActiveRecord::Migration
  def change
  	add_column :users, :sidebar, :text
  end
end
