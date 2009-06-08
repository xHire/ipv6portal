class CreateProviderTexts < ActiveRecord::Migration
  def self.up
    create_table :provider_texts do |t|
			t.string		:author,					:limit => 30,		:null => false
			t.string		:email,						:limit => 50,		:null => false
			t.string		:ip,							:limit => 39,		:null => false
			t.datetime	:created_at,											:null => false
			t.integer		:provider_id,											:null => false
			t.text			:content,													:null => false
    end
  end

  def self.down
    drop_table :provider_texts
  end
end
