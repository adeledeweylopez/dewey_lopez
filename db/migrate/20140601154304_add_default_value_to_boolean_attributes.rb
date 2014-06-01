class AddDefaultValueToBooleanAttributes < ActiveRecord::Migration
  def change
  	change_column :pages, :public, :boolean, :default => false
  	change_column :pages, :sequence, :boolean, :default => false
  end
end
