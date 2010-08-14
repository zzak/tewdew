class AddListToTasks < ActiveRecord::Migration
  def self.up
		add_column :tasks, :list_id, :integer

	end

  def self.down
 		removce_column :tasks, :list_id 
	end
end
