class AddTokenToComments < ActiveRecord::Migration
  def change
  	add_column :comments, :token, :string
  	add_index  :comments, :token
  end
end
