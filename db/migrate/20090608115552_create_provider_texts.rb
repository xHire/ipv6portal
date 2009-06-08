class CreateProviderTexts < ActiveRecord::Migration
  def self.up
    create_table :provider_texts do |t|

      t.timestamps
    end
  end

  def self.down
    drop_table :provider_texts
  end
end
