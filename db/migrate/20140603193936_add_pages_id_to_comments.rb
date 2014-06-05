class AddPagesIdToComments < ActiveRecord::Migration
  def change
  	add_column :comments, :pages_id, :integer
  	add_index  :comments, :pages_id
  end
end
