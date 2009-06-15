class AddProvidersSeoname < ActiveRecord::Migration
	def self.up
		add_column :providers, :seoname, :string, :limit => 35, :null => false, :after => :name
	end

	def self.down
		remove_column :providers, :seoname
	end
end
