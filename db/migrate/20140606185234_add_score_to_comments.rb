class AddScoreToComments < ActiveRecord::Migration
  def change
  	add_column :comments, :score, :integer
  	add_index :comments, [:score, :created_at]
  end
end
