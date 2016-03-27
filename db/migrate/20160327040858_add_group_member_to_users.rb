class AddGroupMemberToUsers < ActiveRecord::Migration
  def change
    add_column :users, :group_member, :boolean
  end
end
