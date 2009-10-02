for model in [ 'provider', 'provider_text', 'isp', 'serverhousing', 'webhosting' ] do
  require File.join(RAILS_ROOT, 'app', 'models', model)
end

class AddProvidersSeoname < ActiveRecord::Migration
  def self.up
    add_column :providers, :seoname, :string, :limit => 35, :null => false, :after => :name

    providers = Provider.all
    for provider in providers do
      provider.seoname = provider.name.seolize
      provider.save!
    end
  end

  def self.down
    remove_column :providers, :seoname
  end
end
