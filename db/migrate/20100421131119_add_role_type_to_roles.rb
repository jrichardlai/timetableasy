class AddRoleTypeToRoles < ActiveRecord::Migration
  def self.up
    add_column :roles, :role_type_id, :integer
  end

  def self.down
    remove_column :roles, :role_type_id
  end
end
