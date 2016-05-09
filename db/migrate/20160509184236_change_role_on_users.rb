class ChangeRoleOnUsers < ActiveRecord::Migration
  def change
    change_column_null :users, :role, false
    change_column_default :users, :role, from: nil, to: 0
  end
end
