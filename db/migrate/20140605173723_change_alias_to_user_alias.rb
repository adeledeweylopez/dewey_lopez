class ChangeAliasToUserAlias < ActiveRecord::Migration
  def change
  	rename_column :users, :alias, :user_alias
  end
end
