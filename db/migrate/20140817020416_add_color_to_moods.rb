class AddColorToMoods < ActiveRecord::Migration
  def change
    add_column :moods, :color, :string
  end
end
