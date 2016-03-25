class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.text :location
      t.text :imdb_id
      t.date :date
      t.text :time
      t.timestamps null: false
    end
  end
end
