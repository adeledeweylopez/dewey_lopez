class AddNotesToMoods < ActiveRecord::Migration
  def change
    add_column :moods, :notes, :string
  end
end
