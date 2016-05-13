class ChangeRoleOnUsers < ActiveRecord::Migration
  def up
    change_column_default :users, :role, 0
    change_column_null :users, :role, false
  end
  
  def down
    change_column_default :users, :role, nil
    change_column_null :users, :role, true
  end
end
