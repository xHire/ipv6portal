class Provider < ActiveRecord::Base
	has_many :texts, :class_name => "ProviderText"

	validates_presence_of :author, :email, :name, :url
end
