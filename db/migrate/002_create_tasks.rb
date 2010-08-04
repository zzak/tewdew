migration 2, :create_tasks do
  up do
    create_table :tasks do
      column :id, DataMapper::Property::Integer, :serial => true
      column :title, DataMapper::Property::String
      column :status, DataMapper::Property::Boolean, :default => false
      column :created_at, DataMapper::Property::DateTime
      column :account_id, DataMapper::Property::Integer
    end
  end

  down do
    drop_table :tasks
  end
end
