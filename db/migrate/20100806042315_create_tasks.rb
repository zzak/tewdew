class CreateTasks < ActiveRecord::Migration
  def self.up
    create_table :tasks do |t|
      t.string :title
      t.boolean :status
      t.users :references

      t.timestamps
    end
  end

  def self.down
    drop_table :tasks
  end
end
