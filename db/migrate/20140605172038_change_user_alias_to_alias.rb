class ChangeUserAliasToAlias < ActiveRecord::Migration
  def change
  	rename_column :users, :user_alias, :alias
  end
end
