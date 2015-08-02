class RemoveUsernameFromUser < ActiveRecord::Migration
  def up
    remove_column :users, :username
  end

  def down
    raise ActiveRecord::IrreversibleMigration, "Can't recover deleted :username column"
  end
end
