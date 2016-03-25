class CreateGroups < ActiveRecord::Migration
  def change
    create_table :groups do |t|
      t.text :name
      t.text :image
      t.timestamps null: false
    end
  end
end
