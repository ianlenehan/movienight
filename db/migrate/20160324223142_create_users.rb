class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.text :email
      t.text :name_first
      t.text :name_last
      t.text :password_digest
      t.text :image
      t.boolean :admin, default: false
      t.integer :group_id
      t.timestamps null: false
    end
  end
end
