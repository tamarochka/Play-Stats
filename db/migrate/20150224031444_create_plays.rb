class CreatePlays < ActiveRecord::Migration
  def change
    create_table :plays do |t|
      t.string :title, null: false
    end
  end
end
