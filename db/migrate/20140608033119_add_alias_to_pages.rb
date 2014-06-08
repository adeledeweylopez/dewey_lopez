class AddAliasToPages < ActiveRecord::Migration
  def change
  	add_column :pages, :page_alias, :string
  end
end
