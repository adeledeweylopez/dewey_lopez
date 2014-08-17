class AddMoodurlToUsers < ActiveRecord::Migration
  def change
    add_column :users, :moodurl, :string
  end
end
