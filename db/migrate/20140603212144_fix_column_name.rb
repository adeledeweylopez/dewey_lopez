class FixColumnName < ActiveRecord::Migration
  def change
  	rename_column :comments, :pages_id, :page_id 
  end
end
