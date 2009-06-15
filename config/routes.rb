ActionController::Routing::Routes.draw do |map|
	map.namespace :database, :name_prefix => 'db_', :path_prefix => 'databaze' do |db|
		db.providers				':type', :controller => 'providers', :action => 'list'
		db.providers_letter	':type/vzorovy-email', :controller => 'providers', :action => 'letter'
		db.provider_new			':type/pridat', :controller => 'providers', :action => 'new', :conditions => { :method => :get }
		db.provider_create	':type/pridat', :controller => 'providers', :action => 'create', :conditions => { :method => :post }
		db.provider_show		':type/:id', :controller => 'providers', :action => 'show'
	end

	map.db 'databaze', :controller => 'database/base'
	map.contact 'kontakt', :controller => 'base', :action => 'contact'

	map.wiki ':page', :controller => 'base'

	map.root :controller => 'base'
end
