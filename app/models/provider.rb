class Provider < ActiveRecord::Base
	has_many :texts, :class_name => "ProviderText"

	validates_presence_of :author, :email, :name, :url
	validates_inclusion_of :status, :in => 0..2
	validates_as_email :email, :message => 'neodpovídá platnému formátu'
end
