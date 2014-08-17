class CreateMoods < ActiveRecord::Migration
  def change
    create_table :moods do |t|
      t.string :name
      t.integer :value
      t.integer :user_id

      t.timestamps
    end
  end
end
