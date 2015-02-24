class CreateScenes < ActiveRecord::Migration
  def change
    create_table :scenes do |t|
      t.string :name, null: false
      t.integer :play_id, null: false
    end
  end
end
