class AddRegistrationFieldsToUsers < ActiveRecord::Migration
  def self.up
		change_table :users do |t|
			add_column :users, :name, :string, :limit => 50
			add_column :users, :company, :string, :limit => 50
			add_column :users, :country, :string, :limit => 50
			add_column :users, :website, :string
			add_column :users, :approved, :boolean, :default => false
		end
  end

  def self.down
		change_table :users do |t|
			t.remove :name
			t.remove :company
			t.remove :country
			t.remove :website
			t.remove :approved
		end
  end
end
