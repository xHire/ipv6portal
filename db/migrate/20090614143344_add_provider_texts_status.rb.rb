class AddProviderTextsStatus < ActiveRecord::Migration
  def self.up
		add_column :provider_texts, :status, :integer
  end

  def self.down
		remove_column :provider_texts, :status
  end
end
