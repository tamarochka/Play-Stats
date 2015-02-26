class CreateLines < ActiveRecord::Migration
  def change
    create_table :lines do |t|
      t.string :body, null: false
      t.integer :speech_id, null: false
    end
  end
end
