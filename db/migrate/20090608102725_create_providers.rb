class CreateProviders < ActiveRecord::Migration
  def self.up
    create_table :providers do |t|
			t.string		:type,						:limit => 20,		:null => false	
			t.string		:author,					:limit => 30,		:null => false
			t.string		:email,						:limit => 50,		:null => false
			t.string		:ip,							:limit => 39,		:null => false
			t.datetime	:created_at,											:null => false
			t.datetime	:updated_at,											:null => false
			t.string		:name,						:limit => 35,		:null => false
			t.string		:url,							:limit => 100,	:null => false
			t.integer		:status,													:null => false
    end
  end

  def self.down
    drop_table :providers
  end
end
